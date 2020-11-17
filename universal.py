import json
import asyncio
import tkinter
import requests
import tkinter.filedialog
from tkinter import messagebox as mb
import os
import json
import lupa
import re 
from pyperclip import copy
lua = lupa.LuaRuntime(unpack_returned_tuples=True)
class Gui(tkinter.Tk):
	def __init__(self):
		super().__init__()

		self.title("Universal Constant Dumper")
		self.options_menu = ObfuscationOptionsMenu(self)
		self.text_field_frame = TextFieldFrame(self, self.options_menu)


class ObfuscationOptionsMenu(tkinter.Frame):

	def __init__(self, parent):
		super().__init__(parent)
		self.pack(side=tkinter.RIGHT, fill=tkinter.NONE, expand=tkinter.FALSE)

		self.PSU = tkinter.BooleanVar()
		tkinter.Checkbutton(self, text='PSU', var=self.PSU).pack(anchor=tkinter.W)

		self.AZTUP = tkinter.BooleanVar()
		tkinter.Checkbutton(self, text='AztupBrew', var=self.AZTUP).pack(anchor=tkinter.W)

		self.BEAUTIFY = tkinter.BooleanVar()
		tkinter.Checkbutton(self, text='Beautify', var=self.BEAUTIFY).pack(anchor=tkinter.W)

		self.RUNCODE = tkinter.BooleanVar()
		tkinter.Checkbutton(self, text='Run on LUA', var=self.RUNCODE).pack(anchor=tkinter.W)
	
	def get_options_state(self):
		if self.PSU.get() == True:
			return "PSU"
		elif self.AZTUP.get() == True:
			return "AZTUP"
		elif self.BEAUTIFY.get() == True:
			return "BEAU"
		elif self.RUNCODE.get() == True:
			return "RUNCODE"
		else:
			return False


class TextFieldFrame(tkinter.Frame):

	def __init__(self, parent, options_menu):
		super().__init__(parent)

		self.pack(side=tkinter.BOTTOM)

		self.pack(side=tkinter.LEFT)
		self.text_field = TextField(self)
		self.text_field_buttons = TextFieldButtons(self, TextFieldActions(self.text_field, options_menu))

class TextField(tkinter.Text):

	def __init__(self, parent):
		super().__init__(parent, width=60, height=20)
		self.pack()
	
	def get_text(self):
		return self.get(1.0, tkinter.END)
	
	def set_text(self, new_text):
		self.delete(1.0, tkinter.END)
		self.insert(tkinter.END, new_text)

class TextFieldButtons(tkinter.Frame):

	def __init__(self, parent, text_field_actions):
		super().__init__(parent)

		self.pack(side=tkinter.BOTTOM, anchor=tkinter.W)
		tkinter.Button(self, command=text_field_actions.obfuscate_init,text='Run').pack(side='left')
		tkinter.Button(self, text='Open file', command=text_field_actions.open_file).pack(side='left')
		tkinter.Button(self, text='Clear text', command=text_field_actions.clear_text).pack(side='left')
		tkinter.Button(self, text='Copy text', command=text_field_actions.copy_text).pack(side='left')
class TextFieldActions():

	def __init__(self, text_field: TextField, options_menu: ObfuscationOptionsMenu):
		
		self.text_field = text_field
		self.text_field.set_text("Made by GameOverAgain")
		self.options_menu = options_menu

	def open_file(self):
		script_directory = tkinter.filedialog.askopenfilename(initialdir = "/",title = "Select script", filetypes=(("Text files",".txt .lua"),))

		try: self.text_field.set_text(open(script_directory, mode='r').read())
		except: return

	def obfuscate_init(self):
		asyncio.run(self.obfuscate())
	
	async def obfuscate(self):
		choose = self.options_menu.get_options_state()
		if choose == "AZTUP" or choose == "PSU" or choose == "BEAU" or choose == "RUNCODE":
			if "Made by GameOverAgain" in self.text_field.get_text():
				mb.showwarning("Hai","Please paste smth lol")
			elif choose == "AZTUP" or choose == "PSU" or choose == "BEAU" or choose == "RUNCODE":
				text = self.text_field.get_text()
				f1=open('beau/1.lua','w')
				f1.write(text)
				f1.close()
				beau = lua.execute(open('beau/beau.lua').read())
				fin = open("beau/2.lua", "rt")
				data = fin.read()
				fin.close()
				if choose == "AZTUP":
					replacething = re.sub(r"(return)(\s*\w\(\w\));?",rf'print(\2)', data)
					apidata = requests.post("https://rextester.com/rundotnet/api",data={'LanguageChoice': 14,'Program':replacething,'Input':'','CompilerArgs':''})
					responsedata = json.loads(apidata.text)
					try:
						self.text_field.set_text(responsedata["Result"])
					except:
						try:
							self.text_field.set_text(responsedata['Warnings'])
						except:
							try:
								self.text_field.set_text(responsedata['Errors'])
							except:
								pass
				elif choose == "PSU":
					finddes = re.search(r"\w\[\w\]\s=\s\w;\n\s*end;\n\s*break;",data)
					finddes2 = finddes[0] 
					replacething = re.sub(r"(\w\[\w\]\s=\s\w;)(\n\s*end;\n\s*break;)",rf'\1print({finddes2[7]})\2', data)
					apidata = requests.post("https://rextester.com/rundotnet/api",data={'LanguageChoice': 14,'Program':replacething,'Input':'','CompilerArgs':''})
					responsedata = json.loads(apidata.text)
					try:
						self.text_field.set_text(responsedata["Result"])
					except:
						try:
							self.text_field.set_text(responsedata['Warnings'])
						except:
							try:
								self.text_field.set_text(responsedata['Errors'])
							except:
								pass
				elif choose == "BEAU":
					self.text_field.set_text(data)
				elif choose == "RUNCODE":
					apidata = requests.post("https://rextester.com/rundotnet/api",data={'LanguageChoice': 14,'Program':text,'Input':'','CompilerArgs':''})
					responsedata = json.loads(apidata.text)
					try:
						self.text_field.set_text(responsedata["Result"])
					except:
						try:
							self.text_field.set_text(responsedata['Warnings'])
						except:
							try:
								self.text_field.set_text(responsedata['Errors'])
							except:
								pass

		elif choose == False:
			mb.showwarning("Made by GameOverAgain","Please choose obfuscator")
	
	
	def clear_text(self):
		self.text_field.set_text('')
	
	def copy_text(self):
		copy(self.text_field.get_text())
		


def merge_two_dicts(x, y):
	z = x.copy()   # start with x's keys and values
	z.update(y)    # modifies z with y's keys and values & returns None
	return z

if __name__ == '__main__':
	gui = Gui()
	gui.mainloop()






	

