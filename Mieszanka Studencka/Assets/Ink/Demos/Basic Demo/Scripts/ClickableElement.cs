using UnityEngine;

public class ClickableItem : MonoBehaviour {
    [SerializeField] public string myKnotName; 
    [SerializeField] public BasicInkExample dialogueSystem;
    public string objectName;
    public bool isChecked = false;

    void OnMouseDown() {
        Debug.Log("Interactive Element Clicked");
        if (dialogueSystem != null) {
            isChecked = true;
            dialogueSystem.CheckProgress();
            dialogueSystem.LoadStoryAtKnot(myKnotName);
        }
    }
}