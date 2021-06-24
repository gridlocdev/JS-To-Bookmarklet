# JS To Bookmarklet

<p align="center">
<img alt="JavaScript Bookmarklet Logo" src="./README_images/JavaScript-Bookmarklet-logo.png" width="150px">
</p>  

- [JS To Bookmarklet](#js-to-bookmarklet)
  - [What are Bookmarklets](#what-are-bookmarklets)
  - [What is this tool?](#what-is-this-tool)
  - [What does this PowerShell script do?](#what-does-this-powershell-script-do)
  - [How do I use this script?](#how-do-i-use-this-script)
  - [How do I add the Bookmarklet to my browser?](#how-do-i-add-the-bookmarklet-to-my-browser)
    - [Google Chrome](#google-chrome)
    - [Microsoft Edge](#microsoft-edge)
    - [Firefox](#firefox)
    - [Brave](#brave)

## What are Bookmarklets

Bookmarklets are small JavaScript snippets that you can save into your browser's bookmarks bar. These are generally used to perform usually time consuming or repetitive tasks via executing JavaScript instead of doing them manually.

## What is this tool?

JS-to-bookmarklet is a PowerShell script I created to convert Javascript files into the Bookmarklet syntax.

This script is for folks that can code in JavaScript that would like to create a custom JavaScript file to be able to execute on a page.

## What does this PowerShell script do?

It's a pretty small utility, all it does is takes out all the line breaks and spaces from a JavaScript file and inserts the Bookmarklet browser syntax around it. Feel free to edit it as you need if something does not work in your exported JavaScript bookmarklet.

## How do I use this script?

1. Download the files from this repository through this website's "Code" button -> Download ZIP, or using the Git CLI
2. Navigate to the downloaded folder in File Explorer
3. Add the JavaScript file you would like to make a bookmarklet to the root of the folder, next to the .ps1 file
4. Open the settings.json file in a text editor, and fix up the config file to where you'd like the script to look on your machine.
   1. Change the value of the setting ```script_name``` to your script's name.
   2. Change the value of the setting ```input_folder``` to the folder your script is located in.
   3. Change the value of the setting ```output_folder``` where you would like to output the Bookmarklet text file.
5. Navigate back to the downloaded folder in File Explorer
6. Right click the ```JS-to-bookmarklet.ps1``` PowerShell file and select "_Run with PowerShell_"
7. The output is stored in the file ```{{Your File's Name}}.js.bookmarklet.txt```. Open the file, then check out the below instructions on how to add it to your browser! : [How do I add the Bookmarklet to my browser?](#how-do-i-add-the-bookmarklet-to-my-browser)

## How do I add the Bookmarklet to my browser?

After you create your bookmarklet one-liner JavaScript file, you'll probably want to add it to the browser so you can use it. Once created, you can run the JavaScript code like any other usual link by just clicking the bookmark.

### Google Chrome

> 1. Navigate to the URL [chrome://bookmarks/](https://chrome://bookmarks/)
> 2. On the top right of Bookmarks page's navbar, click the hamburger icon
> 3. Select "Add new bookmark"
> 4. Enter the following information:
>    1. Name: What you would like your bookmark title text to say
>    2. URL: Insert your Bookmarklet JavaScript code, which was outputted to the file ```{{Your File's Name}}.js.bookmarklet.txt```
> 5. Click "Save"

### Microsoft Edge

> 1. Navigate to the URL [edge://favorites/](https://edge://favorites/)
> 2. On the upper right of the Favorites page, click "_Add favorite_"
> 3. Enter the following information:
>    1. Name: What you would like your bookmark title text to say
>    2. URL: Insert your Bookmarklet JavaScript code, which was outputted to the file ```{{Your File's Name}}.js.bookmarklet.txt```
> 4. Click "Save"

### Firefox

> 1. Press "_Ctrl + Shift + O_" to open the Library
> 2. Click "Organize", then "New Bookmark"
> 3. Enter the following information:
>    1. Name: What you would like your bookmark title text to say
>    2. Location: Insert your Bookmarklet JavaScript code, which was outputted to the file ```{{Your File's Name}}.js.bookmarklet.txt```
> 4. Click "Add"

### Brave

> 1. Navigate to the URL [brave://bookmarks/](brave://bookmarks/)
> 2. On the top right of Bookmarks page under the navbar, click the hamburger icon
> 3. Select "Add new bookmark"
> 4. Enter the following information:
>    1. Name: What you would like your bookmark title text to say
>    2. URL: Insert your Bookmarklet JavaScript code, which was outputted to the file ```{{Your File's Name}}.js.bookmarklet.txt```
> 5. Click "Save"
