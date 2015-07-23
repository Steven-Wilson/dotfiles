import sublime, sublime_plugin

# Shamelessly stolen from https://github.com/SublimeText/MouseEventListener
# because I couldn't figure out how to inherit from it without
# putting it in it's own file

class DragSelectCallbackCommand(sublime_plugin.TextCommand):
	def run_(self, edit, args):
		for c in sublime_plugin.all_callbacks.setdefault('on_pre_mouse_down',[]):
			c.on_pre_mouse_down(self.view, args)
		old_sel = [r for r in self.view.sel()]
		self.view.run_command("drag_select", {'event': args['event']})
		new_sel = self.view.sel()
		click_point = new_sel[0].a
		new_sel.clear()
		for r in old_sel:
			new_sel.add(r)
		self.view.run_command("drag_select", args)

		for c in sublime_plugin.all_callbacks.setdefault('on_post_mouse_down',[]):
			c.on_post_mouse_down(self.view, click_point)

class MouseEventListener(sublime_plugin.EventListener):
	sublime_plugin.all_callbacks.setdefault('on_pre_mouse_down', [])
	sublime_plugin.all_callbacks.setdefault('on_post_mouse_down', [])


# Call vintageous enter insert mode on click
class MouseEventProcessor(MouseEventListener):
	def on_pre_mouse_down(self, view, args):
		view.run_command("_enter_insert_mode", {'mode': 'mode_normal'})
