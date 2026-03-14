using System;
using Ink.Runtime;
using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic; // To musi być na samej górze!

// This is a super bare bones example of how to play and display a ink story in Unity.
public class BasicInkExample : MonoBehaviour {
    public static event Action<Story> OnCreateStory;
	private bool choicesShown = false;
	public GameObject dialogueBox;
	public GameObject choicesContainer; 
	private bool clickedThisFrame = false;

    void Awake () {
		// Remove the default message
		RemoveChildren();
		StartStory();
	}

	// Creates a new Story object with the compiled story which we can then play!
	void StartStory () { 
		story = new Story (inkJSONAsset.text);
		// story.BindExternalFunction("pokazObiekt", (string nazwa) => {
    	// 	foreach(var item in allSceneObjects) {
        // 		if(item.name == nazwa) {
        //     		item.prefab.SetActive(true);
		//         }
    	// 	}
		// });
        if(OnCreateStory != null) OnCreateStory(story);
	}
	
	void Update() {	
		if (Input.GetMouseButtonDown(0)) {
			Debug.Log("Kliknięcie wykryte! canContinue: " + story.canContinue); 
			if (clickedThisFrame) return;
        	if (story.canContinue) {
            	AdvanceStory();
	        } 
    	    else if (story.currentChoices.Count > 0 && !choicesShown) {
        	    ShowChoices();
	        }
			else if (!story.canContinue && story.currentChoices.Count == 0) {
				CloseDialogue();
	        }
	    }
	}

void LateUpdate() {
    clickedThisFrame = false;
}

void AdvanceStory() {
	dialogueBox.SetActive(true);
    RemoveChildren();
    choicesShown = false;
    
    string text = story.Continue().Trim();
    CreateContentView(text);
}

void ShowChoices() {
    choicesShown = true;
    
	choicesContainer.transform.SetAsLastSibling();

    foreach (Choice choice in story.currentChoices) {
        Button button = CreateChoiceView(choice.text.Trim());
        button.onClick.AddListener(() => OnClickChoiceButton(choice));
    }
}

void OnClickChoiceButton(Choice choice) {
    story.ChooseChoiceIndex(choice.index);
    choicesShown = false;
    
    AdvanceStory();
}

void CloseDialogue() {
	RemoveChildren();
	dialogueBox.SetActive(false);
	choicesShown = false; 
}

	// Creates a textbox showing the the line of text
	void CreateContentView (string text) {
		Text storyText = Instantiate (textPrefab) as Text;
		storyText.text = text;
		storyText.transform.SetParent (dialogueBox.transform, false);
	}

	// Creates a button showing the choice text
	Button CreateChoiceView (string text) {
		// Creates the button from a prefab
		Button choice = Instantiate (buttonPrefab) as Button;
		choice.transform.SetParent (choicesContainer.transform, false);
		
		// Gets the text from the button prefab
		Text choiceText = choice.GetComponentInChildren<Text> ();
		choiceText.text = text;

		// Make the button expand to fit the text
		HorizontalLayoutGroup layoutGroup = choice.GetComponent <HorizontalLayoutGroup> ();
		layoutGroup.childForceExpandHeight = false;

		return choice;
	}
	
	// Destroys all the children of this gameobject (all the UI)
	void RemoveChildren () {
	    foreach (Transform child in dialogueBox.transform) {
        // Nie usuwamy kontenera na przyciski!
        if (child.gameObject != choicesContainer) {
            Destroy(child.gameObject);
        }
    	}
	    foreach (Transform child in choicesContainer.transform) {
    	    Destroy(child.gameObject);
	    }
	}

    public void LoadStoryAtKnot(string knotName) {
        if (story != null) {
			clickedThisFrame = true;
            dialogueBox.SetActive(true);
            story.ChoosePathString(knotName);
            AdvanceStory();
        } else {
            Debug.LogError("Błąd: Story nie jest zainicjalizowane!");
        }
    }

	[SerializeField]
	private TextAsset inkJSONAsset = null;
	public Story story;

	[SerializeField]
	public bool cutScene = false;

	[SerializeField]
	private Canvas canvas = null;

	// UI Prefabs
	[SerializeField]
	private Text textPrefab = null;
	[SerializeField]
	private Button buttonPrefab = null;

	[System.Serializable]
	public struct SceneObject {
    	public string name;
    	public GameObject prefab;
	}
	public List<GameObject> sceneObjects = new List<GameObject>();

}
