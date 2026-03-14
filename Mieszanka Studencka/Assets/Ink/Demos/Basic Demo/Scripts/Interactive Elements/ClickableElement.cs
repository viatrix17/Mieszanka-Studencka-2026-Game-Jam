using UnityEngine;

public class ClickableItem : MonoBehaviour {
    [SerializeField] public string myKnotName; 
    [SerializeField] public BasicInkExample dialogueSystem;

    void OnMouseDown() {
        Debug.Log("Interactive Element Clicked");
        if (dialogueSystem != null) {
            dialogueSystem.LoadStoryAtKnot(myKnotName);
        }
    }
}