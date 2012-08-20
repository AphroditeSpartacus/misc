import sublime, sublime_plugin

class Clear_selectionCommand(sublime_plugin.TextCommand):
    def run(self, view):
        p = self.view.sel()[0].end()
        self.view.sel().clear()
        self.view.sel().add(sublime.Region(p))