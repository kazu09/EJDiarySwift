# EJ Diary
## Screen Description
### Top screen
* \+ Button
  * Screen transition to create diary screen.
  * Can only be created once per day.After create, the button will be disabled.
* diary button
  * It will be display if the diary create is successful.
  * The button text is the creation date (yyyy/mm/dd)
  * Transitions to the diary screen..

### Create diary screen
* Text input area "日本語の日記".
  * You can input text.
  * Displays the default keyboard.
* Text input area "English diary".
  * You can input text.
  * Displays the English keyboard.
* Button "保存".
  * Saves the following state.
    * Japanese diary text, English diary text, date and time.
  * Create screen close after tap to "保存" button.
* Button "日本語の日記を隠す".
  * Hides the japanese text area.
  * When hidden, "非表示..." will be display.
  * When hidden, the button text will be "日本語の日記を戻す".
* Button "Hide english diary".
  * Hides the english text area.
  * When hidden, "hidden..." will be display.
  * When hidden, the button text will be "Show English diary".

### Update diary screen
* Text input area "日本語の日記".
  * You can input text.
  * Displays the default keyboard.
* Text input area "English diary".
  * You can input text.
  * Displays the English keyboard.
* Button "更新する".
  * Saves the following state.
    * Japanese diary text, English diary text, Japanese text display/hide flag, English text display/hide flag.
  * When the update is complete, a toast message will be displayed.
* Button "日本語の日記を隠す".
  * Hides the japanese text area.
  * When hidden, "非表示..." will be display.
  * When hidden, the button text will be "日本語の日記を戻す".
* Button "Hide english diary".
  * Hides the english text area.
  * When hidden, "hidden..." will be display.
  * When hidden, the button text will be "Show English diary".

## CoreData
| Coulum Name | Data Type |
|  ---  |  ---  |
| date | Date |
| enText | String |
| isEnTextHide | Bool |
| jpText | String |
| isJpTextHide | Bool |
| title | String |

## Japanese document
