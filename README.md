# GNU Emacs configuration settings
![GNU Emacs 25.1 running on Ubuntu 16.04.1 with these customizations as of commit 0094809](http://i.imgur.com/faKhZUd.png)
My GNU Emacs configuration settings, originally developed on a Ubuntu 16.04.1 LTS system on my HP Envy 17 laptop. It has more traditional keybindings, which are discussed in the [keybindings](#keybindings) section of this README.

## Keybindings
| Command                   | Keybind   | Description                                                    |
|---------------------------|-----------|----------------------------------------------------------------|
| `browse-web`              | `M-w`     | Open URL in embedded web browser.                              |
| `compile`                 | `M-x`     | Run `make -k` from the directory of the presently-opened file. |
| `dired`                   | `C-S-o`   | Open directory.                                                |
| `elfeed`                  | `C-x w`   | Toggle elfeed.                                                 |
| `gdb`                     | `M-g`     | Attached the GDB debugger to a compiled program.               |
| `isearch-forward`         | `C-f`     | Find in present buffer.                                        |
| `ispell-buffer`           | `M-s`     | Run spell-checker on current buffer.                           |
| `load-file`               | `C-l`     | Load Emacs Lisp file.                                          |
| `menu-find-file-existing` | `C-o`     | Open file.                                                     |
| `package-install`         | `C-p`     | Run the in-built package installer.                            |
| `save-buffer`             | `C-s`     | Save the current file.                                         |
| `term`                    | `C-t`     | Open the terminal buffer.                                      |
| `undo`                    | `C-z`     | Undo the last change.                                          |

plus the [CUA bindings](https://www.gnu.org/software/emacs/manual/html_node/emacs/CUA-Bindings.html). 
