using System;
using System.Linq;
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
	public List<ClickableItem> allActiveItems = new List<ClickableItem>();

    void Awake () {
		// GameObject[] scenesToHide = GameObject.FindGameObjectsWithTag("InteractiveElements");

	    // foreach (GameObject scene in scenesToHide) {
    	//     scene.SetActive(false);
	    // }

		RemoveChildren();
		StartStory();
	}

	// Creates a new Story object with the compiled story which we can then play!
	void StartStory () { 
		story = new Story (inkJSONAsset.text);
		story.BindExternalFunction("showObjects", (string name) => {
            ManageObject(name, true);
        });
		story.BindExternalFunction("hideObjects", (string name) => {
            ManageObject(name, false);
        });
        if(OnCreateStory != null) OnCreateStory(story);
		AdvanceStory();
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


	void ManageObject(string name, bool action) {
        GameObject[] allObjects = Resources.FindObjectsOfTypeAll<GameObject>();

        GameObject target = allObjects.FirstOrDefault(obj => obj.name == name);

        if (target != null) {
            target.SetActive(action);
			FindAllItems();
            Debug.Log("Success: " + name + " is now " + action);
        } else {
            Debug.LogError("Error: Could not find a GameObject named " + name);
        }
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

	public void FindAllItems() {
    	allActiveItems.Clear();

    	allActiveItems = GameObject.FindObjectsOfType<ClickableItem>().ToList();

    	Debug.Log("Znaleziono interaktywnych przedmiotów: " + allActiveItems.Count);
	}

	public void CheckProgress() {
		bool allDone = true;
		foreach (var item in allActiveItems) {
			if(!item.isChecked) {
				allDone = false;
				break;
			}
		}
		if (allDone) {
			story.variablesState["all_checked"] = true;
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

}
