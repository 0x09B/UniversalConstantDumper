import json
import asyncio
import tkinter as tk
from tkinter import filedialog, messagebox as mb
import requests
import os
import re
from pyperclip import copy
from lupa import LuaRuntime

lua = LuaRuntime(unpack_returned_tuples=True)

class Gui(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Universal Constant Dumper")
        self.options_menu = ObfuscationOptionsMenu(self)
        self.text_field_frame = TextFieldFrame(self, self.options_menu)


class ObfuscationOptionsMenu(tk.Frame):
    def __init__(self, parent):
        super().__init__(parent)
        self.pack(side=tk.RIGHT, fill=tk.NONE, expand=False)

        self.options = {
            "PSU": tk.BooleanVar(),
            "AztupBrew": tk.BooleanVar(),
            "Beautify": tk.BooleanVar(),
            "Run on LUA": tk.BooleanVar()
        }

        for text, var in self.options.items():
            tk.Checkbutton(self, text=text, variable=var).pack(anchor=tk.W)

    def get_selected_option(self):
        for option, var in self.options.items():
            if var.get():
                return option
        return None


class TextFieldFrame(tk.Frame):
    def __init__(self, parent, options_menu):
        super().__init__(parent)
        self.pack(side=tk.BOTTOM)
        self.text_field = TextField(self)
        self.text_field_buttons = TextFieldButtons(self, TextFieldActions(self.text_field, options_menu))


class TextField(tk.Text):
    def __init__(self, parent):
        super().__init__(parent, width=60, height=20)
        self.pack()

    def get_text(self):
        return self.get("1.0", tk.END).strip()

    def set_text(self, new_text):
        self.delete("1.0", tk.END)
        self.insert(tk.END, new_text)


class TextFieldButtons(tk.Frame):
    def __init__(self, parent, text_field_actions):
        super().__init__(parent)
        self.pack(side=tk.BOTTOM, anchor=tk.W)

        buttons = [
            ("Run", text_field_actions.obfuscate_init),
            ("Open File", text_field_actions.open_file),
            ("Clear Text", text_field_actions.clear_text),
            ("Copy Text", text_field_actions.copy_text)
        ]

        for text, command in buttons:
            tk.Button(self, text=text, command=command).pack(side=tk.LEFT)


class TextFieldActions:
    def __init__(self, text_field, options_menu):
        self.text_field = text_field
        self.options_menu = options_menu
        self.text_field.set_text("Made by GameOverAgain")

    def open_file(self):
        file_path = filedialog.askopenfilename(
            initialdir="/", title="Select script",
            filetypes=[("Text files", ".txt .lua")]
        )

        if file_path:
            try:
                with open(file_path, "r") as file:
                    self.text_field.set_text(file.read())
            except Exception as e:
                mb.showerror("Error", f"Failed to open file: {e}")

    def obfuscate_init(self):
        asyncio.run(self.obfuscate())

    async def obfuscate(self):
        option = self.options_menu.get_selected_option()

        if not option:
            mb.showwarning("Warning", "Please choose an obfuscator")
            return

        text = self.text_field.get_text()
        if "Made by GameOverAgain" in text:
            mb.showwarning("Warning", "Please paste something to obfuscate")
            return

        try:
            if option == "Beautify":
                self.handle_beautify(text)
            elif option in ("PSU", "AztupBrew", "Run on LUA"):
                await self.handle_obfuscation(option, text)
        except Exception as e:
            mb.showerror("Error", f"Obfuscation failed: {e}")

    def handle_beautify(self, text):
        with open('beau/1.lua', 'w') as file:
            file.write(text)

        beau = lua.execute(open('beau/beau.lua').read())
        with open("beau/2.lua", "rt") as file:
            data = file.read()

        self.text_field.set_text(data)

    async def handle_obfuscation(self, option, text):
        if option == "AztupBrew":
            text = self.apply_aztupbrew_regex(text)
        elif option == "PSU":
            text = self.apply_psu_regex(text)

        url = "https://rextester.com/rundotnet/api"
        payload = {"LanguageChoice": 14, "Program": text, "Input": "", "CompilerArgs": ""}

        response = requests.post(url, data=payload)
        response_data = response.json()

        result = response_data.get("Result") or response_data.get("Warnings") or response_data.get("Errors")
        self.text_field.set_text(result or "No output")

    @staticmethod
    def apply_aztupbrew_regex(text):
        return re.sub(r"(return)(\s*\w\(\w\));?", r'print(\2)', text)

    @staticmethod
    def apply_psu_regex(text):
        match = re.search(r"\w\[\w\]\s=\s\w;\n\s*end;\n\s*break;", text)
        if match:
            return re.sub(
                r"(\w\[\w\]\s=\s\w;)(\n\s*end;\n\s*break;)",
                rf'\1print({match.group(0)[7]})\2', text
            )
        return text

    def clear_text(self):
        self.text_field.set_text('')

    def copy_text(self):
        text = self.text_field.get_text()
        if text:
            copy(text)


if __name__ == '__main__':
    gui = Gui()
    gui.mainloop()
