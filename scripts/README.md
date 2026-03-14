## Custom Utilities

This repository includes several small CLI utilities used in my development workflow.
During installation they are symlinked into `~/bin` so they can be executed globally.

### mdump

Creates a **Markdown-formatted dump of a project** including:

* directory tree
* selected file contents
* syntax highlighting

The output is automatically copied to the clipboard.

Example:

```
mdump
mdump ./my_project
mdump ./project --ext rs,py
```

This tool is useful when sending project context to LLMs or sharing project structure.

---

### pdump

Similar to `mdump` but produces **plain text output** instead of Markdown.

Useful when Markdown formatting is not required.

Example:

```
pdump
pdump ./project
pdump ./project --ext rs
```

---

### p_tree

Displays a **filtered project tree** while ignoring common build artifacts.

Ignored paths include:

* `.git`
* `target`
* `node_modules`
* hidden files

Example:

```
p_tree
p_tree ./my_project
```

---

### bluetooth-connect.sh

Simple helper script for connecting a predefined Bluetooth device using `bluetoothctl`.

Example:

```
bluetooth-connect.sh
```

---

### openrouter-test.sh

Small test script for verifying connectivity with the OpenRouter API.

Requires environment variable:

```
export OPENROUTER_API_KEY=your_key_here
```

Run:

```
./openrouter-test.sh
```

This will send a test prompt to the API and print the response.

