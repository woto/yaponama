require 'rubygems'
require 'pdfkit'
require 'ruby-debug'

#PDFKit.new takes the HTML and any options for wkhtmltopdf
# run `wkhtmltopdf --extended-help` for a full list of options
#kit = PDFKit.new(html, :page_size => 'Letter')
#kit.stylesheets << '/path/to/css/file'

# Git an inline PDF
#pdf = kit.to_pdf

# Save the PDF to a file
#file = kit.to_file('/path/to/save/pdf')

# PDFKit.new can optionally accept a URL or a File.
# Stylesheets can not be added when source is provided as a URL of File.
kit = PDFKit.new('http://localhost:3000/1.html')
kit.to_file('./1.pdf')
#pdf = kit.to_pdf
#debugger
#print '1'

#kit = PDFKit.new(File.new('/path/to/html'))

# Add any kind of option through meta tags
#PDFKit.new('<html><head><meta name="pdfkit-page_size" content="Letter")
