require 'xml/smart'

Dir.glob('*.s.xml').each do |f|
  XML::Smart.modify(f) do |doc|
    doc.register_namespace 't', 'http://cpee.org/ns/properties/2.0'
    doc.register_namespace 'd', 'http://cpee.org/ns/description/1.0'
    doc.root.replace_by  doc.find('//d:description').first
    doc.find('//d:annotations').delete_all!
    doc.find('//d:code').delete_all!
    doc.find('//d:documentation').delete_all!
    doc.find('//d:parameters').delete_all!
    doc.find('//d:parameters').delete_all!
    doc.find('//d:_probability').delete_all!
    doc.find('//@pass').delete_all!
    doc.find('//@local').delete_all!
  end
end
