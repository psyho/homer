# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'ctags-bundler' do
  watch(%r{^(lib|spec/support)/.*\.rb$})  { ["lib", "spec/support"] }
  watch('Gemfile.lock')
end

guard 'rspec', :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/unit/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch(%r{^bin/.+$}) { "spec" }

  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
end

