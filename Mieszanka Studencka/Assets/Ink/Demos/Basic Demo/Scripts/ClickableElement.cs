using System.Reflection.Emit;
using UnityEngine;

public class ClickableItem : MonoBehaviour {
    [SerializeField] public string myKnotName; 
    [SerializeField] public BasicInkExample dialogueSystem;
    public string objectName;
    public bool isChecked = false;

    public CinemaController cinemaController;
    
    void OnMouseDown() {
        Debug.Log("Interactive Element Clicked");
        if (dialogueSystem != null) {
            isChecked = true;
            dialogueSystem.LoadStoryAtKnot(myKnotName);
            if (objectName == "ArrowKitchen")
            {
                cinemaController.PlayVideoByLabel("Kitchen");
            }
            if (objectName == "ArrowLivingRoom")
            {
                cinemaController.PlayVideoByLabel("LivingRoom");
            }
        }
    }
}