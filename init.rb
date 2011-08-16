# Item finder

APP_ROOT = File.dirname(__FILE__)

# allows for searching a particular file on require.
$:.unshift(File.join(APP_ROOT, 'lib'))

require "main"

main = Main.new('items.txt')
main.launch!