dir = File.dirname(__FILE__)

# Load the sencha-touch framework
load File.join(dir, '..', 'libs', 'sencha-touch-2-b2', 'resources', 'themes')

# Look for any *.scss files in same directory as this file
# Place compiled *.css files in the parent directory
sass_path    = dir
css_path     = File.join(dir, "..", "css")
output_style = :expanded
environment  = :development