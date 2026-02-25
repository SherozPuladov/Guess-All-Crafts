# Guess All Crafts ⛏️🍰

**Guess All Crafts** is a cross-platform browser game developed specifically for **Yandex Games**. Players immerse themselves in a Minecraft-style cave environment to test their knowledge of crafting recipes. 

This project was built using **Godot 3** and serves as a showcase of mobile/PC cross-platform development, UI implementation, and ad monetization integration.

🎮 **Play the game here:** [Guess All Crafts on Yandex Games](https://yandex.com/games/app/307822)

## 🌟 Gameplay & Features
* **The Challenge:** The player is presented with two portals, each displaying a crafting recipe. One is the correct recipe, and the other is a fake. The goal is to recognize the correct craft and enter the corresponding portal.
* **The Goal:** Successfully guess 100 crafts to reach the end and get a **Cake** (the cake is not a lie!).
* **Penalty System:** Making a mistake costs 10 levels of progress (if you have hearts). If you run out of hearts, your progress completely resets.
* **Localization:** The game supports 3 popular languages: English, Russian, and Turkish.
* **Responsive Controls:** * **PC:** Keyboard (WASD / Arrow keys).
  * **Mobile:** On-screen touch buttons (GamePad).

## 💰 Monetization & SDK Integration
The project uses the **Instant Games Bridge** plugin to seamlessly integrate the Yandex Games SDK:
* **Rewarded Ads:** Players can watch an ad to restore 3 hearts, saving their progress from a total reset.
* **Interstitial Ads:** Integrated regular ad breaks during gameplay.

## 🛠️ How to Add New Crafts
The project architecture makes it extremely easy to scale and add new content. To add a new crafting recipe, follow these exact steps:

1. **Original Name:** The craft must use its original name from the English version of Minecraft.
   * *Example:* `shears` (not `scissors`).
2. **Fake Craft:** The image name of the incorrect craft must end with the `_fake` suffix.
   * *Example:* `armor_stand_fake`.
3. **Import Settings:** Do not change the default Godot import settings for the craft images.
4. **Folder Structure:** Create a dedicated folder for the craft inside the `Crafts` directory.
   * *Examples:* `ArmorStand`, `CraftingTable`, `BookAndQuill`.
5. **Create Resource:** Create a `CraftResource` type resource. The file name must exactly match the craft's name.
   * *Example:* `armor_stand.tres` or `book_and_quill.tres`.
6. **Configure Resource:**
   * Assign the correct craft image to the **Correct** field.
   * Assign the fake craft image to the **Incorrect** field.
7. **Update Manager:** Add the created `.tres` resource to the end of the `crafts` array inside the `CraftsManager` object.

### Final Structure Example:
``` text
📁 Crafts/
 └── 📁 BookAndQuill/
     ├── 🖼️ book_and_quill.png          # Correct craft image
     ├── 🖼️ book_and_quill_fake.png     # Fake craft image
     └── 📄 book_and_quill.tres         # Configured CraftResource
```


## 📸 Screenshots
### 🎮 From game

![Image](./Screenshots/GAC%20Start%20Menu.png "Start Menu")
![Image](./Screenshots/GAC%20full%20hearts%20and%20full%20progress.png "Full hearts and full progress")
![Image](./Screenshots/GAC%20Rewart%20after%20watching%20Ad.png "Reward after watching Ad")
![Image](./Screenshots/GAC%20Showing%20regular%20Ad.png "Showing interstitial Ad")


### 🖊️ From engine

![Image](./Screenshots/GAC%20Godot%20L_Main.png "Godot Main Scene")
![Image](./Screenshots/GAC%20Godot%20Player.png "Godot Player Scene")
![Image](./Screenshots/GAC%20Godot%20GamePad.png "Godot GamePad")

## 📫 Contact
- Developer: Sheroz Pulatov
- Email: sherozpulatov3@gmail.com
- LinkedIn: https://www.linkedin.com/in/sherozpulatov/
- GitHub: https://github.com/SherozPuladov