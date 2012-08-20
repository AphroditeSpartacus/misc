import sublime, sublime_plugin

# Extends TextCommand so that run() receives a View to modify.
class DuplicateCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        # Walk through each region in the selection
        for region in self.view.sel():
            # Only interested in empty regions, otherwise they may span multiple
            # lines, which doesn't make sense for this command.
            if region.empty():
                # Expand the region to the full line it resides on, excluding the newline
                line = self.view.line(region)
                # Extract the string for the line, and add a newline
                line_contents = self.view.substr(line) + '\n'
                # Construct commented contents
                line_contents_strip = line_contents.lstrip()
                spaces = len(line_contents) - len(line_contents_strip)
                commented_contents = ' ' * spaces + '# ' + line_contents_strip
                # Add the text at the beginning of the line
                self.view.insert(edit, line.begin(), commented_contents)
