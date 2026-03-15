using UnityEngine;
using UnityEngine.Video;
using System.Collections.Generic;
using Ink.Runtime;
using System.Data.SqlTypes;

public class CinemaController : MonoBehaviour
{
    [System.Serializable]
    public class VideoStep
    {
        public string label;
        public VideoClip clip;
        public bool isBackground;
        public string inkKnotName;
        public bool triggerOnly;
        public bool isDelayed;
    }
    public BasicInkExample inkManager;
    public VideoPlayer videoPlayer;
    public List<VideoStep> sequence;

    private int currentIndex = 0;
    public float delayBetweenCutscenes = 2.0f;

    void Start()
    {
        if (sequence.Count > 0)
        {
            videoPlayer.loopPointReached += OnVideoEnded;
            PlayStep(0);
        }
    }

    void PlayStep(int index)
    {
        currentIndex = index;
        VideoStep current = sequence[currentIndex];

        videoPlayer.clip = current.clip;

        videoPlayer.isLooping = current.isBackground;

        videoPlayer.Play();
        Debug.Log("Odtwarzam: " + current.label + " | Typ: " + (current.isBackground ? "Tło" : "Cutscenka"));
    }

    void OnVideoEnded(VideoPlayer vp)
    {
        if (sequence[currentIndex].isBackground)
        {
            Debug.Log("Film jest tłem, zapętlam...");
            return;
        }
        if (currentIndex + 1 < sequence.Count)
        {
            VideoStep nextStep = sequence[currentIndex + 1];

            if (!string.IsNullOrEmpty(nextStep.inkKnotName) || !nextStep.triggerOnly)
            {
                if (nextStep.isDelayed)
                {
                    StartCoroutine(Wait());
                }
                else
                {
                    Debug.Log("Wykryto trigger lub liniową sekwencję. Idę do: " + nextStep.label);

                    if (!string.IsNullOrEmpty(nextStep.inkKnotName))
                    {
                        inkManager.LoadStoryAtKnot(nextStep.inkKnotName);
                    }

                    PlayStep(currentIndex + 1);
                }
            }
            else
            {
                Debug.Log("Następny krok wymaga triggera. Zatrzymuję automatyczne odtwarzanie.");
            }
        }
    }

    public void BreakLoopAndContinue()
{
    if (currentIndex + 1 < sequence.Count)
    {
        videoPlayer.isLooping = false;

        VideoStep nextStep = sequence[currentIndex + 1];

        if (nextStep.isDelayed)
        {
            StartCoroutine(Wait());
        }
        else
        {
            TransitionToStep(currentIndex + 1);
        }
    }
    else
    {
        Debug.Log("To był ostatni film w sekwencji.");
    }
}

public void PlayVideoByLabel(string label)
    {
        int index = sequence.FindIndex(step => step.label == label);
        if (index != -1)
        {
            TransitionToStep(index);
        }
        else
        {
            Debug.LogError("Nie znaleziono filmu o etykiecie: " + label);
        }
    }
    System.Collections.IEnumerator Wait()
    {
        Debug.Log("Czekam " + delayBetweenCutscenes + " sekundy...");

        videoPlayer.targetCameraAlpha = 0;

        yield return new WaitForSeconds(delayBetweenCutscenes);

        videoPlayer.targetCameraAlpha = 1;
        //PlayStep(currentIndex + 1);
    }

    private void TransitionToStep(int index)
{
    VideoStep step = sequence[index];

    // Najpierw ustawiamy tekst w Inku (jeśli jest przypisany)
    if (!string.IsNullOrEmpty(step.inkKnotName))
    {
        inkManager.LoadStoryAtKnot(step.inkKnotName);
    }

    // Potem odpalamy film
    PlayStep(index);
}
}