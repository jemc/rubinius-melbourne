require 'mkmf'
require 'rubinius/toolset'
require File.expand_path("../../../../lib/rubinius/melbourne/version", __FILE__)

$CFLAGS += " -ggdb3"

File.open "namespace.h", "wb" do |f|
  version = Rubinius::ToolSet.current::TS::Melbourne::VERSION
  melbourne = "melbourne_#{version.gsub(/\./, "_")}"
  f.puts "#define MELBOURNE                 #{melbourne}"
  f.puts "#define MELBOURNE_FILE_TO_AST     #{melbourne}_file_to_ast"
  f.puts "#define MELBOURNE_STRING_TO_AST   #{melbourne}_string_to_ast"
end

# Courtesy of EventMachine. Thank you EventMachine and tmm1 !
case RUBY_PLATFORM
when /mswin32/, /mingw32/, /bccwin32/
  check_heads(%w[windows.h winsock.h], true)
  check_libs(%w[kernel32 rpcrt4 gdi32], true)

  if GNU_CHAIN
    CONFIG['LDSHARED'] = "$(CXX) -shared -lstdc++"
  else
    $defs.push "-EHs"
    $defs.push "-GR"
  end

when /solaris/
  add_define 'OS_SOLARIS8'

  if CONFIG['CC'] == 'cc' and `cc -flags 2>&1` =~ /Sun/ # detect SUNWspro compiler
    # SUN CHAIN
    add_define 'CC_SUNWspro'
    $preload = ["\nCXX = CC"] # hack a CXX= line into the makefile
    $CFLAGS = CONFIG['CFLAGS'] = "-KPIC"
    CONFIG['CCDLFLAGS'] = "-KPIC"
    CONFIG['LDSHARED'] = "$(CXX) -G -KPIC -lCstd"
  else
    # GNU CHAIN
    # on Unix we need a g++ link, not gcc.
    CONFIG['LDSHARED'] = "$(CXX) -shared"
  end

when /openbsd/
  # OpenBSD branch contributed by Guillaume Sellier.

  # on Unix we need a g++ link, not gcc. On OpenBSD, linking against libstdc++ have to be explicitly done for shared libs
  CONFIG['LDSHARED'] = "$(CXX) -shared -lstdc++ -fPIC"
  CONFIG['LDSHAREDXX'] = "$(CXX) -shared -lstdc++ -fPIC"

when /darwin/
  # on Unix we need a g++ link, not gcc.
  # Ff line contributed by Daniel Harple.
  CONFIG['LDSHARED'] = "$(CXX) " + CONFIG['LDSHARED'].split[1..-1].join(' ')

when /aix/
  CONFIG['LDSHARED'] = "$(CXX) -shared -Wl,-G -Wl,-brtl"

else
  # on Unix we need a g++ link, not gcc.
  CONFIG['LDSHARED'] = "$(CXX) -shared"
end

create_makefile('melbourne')

File.open("Makefile","a+") do |f|
  f.puts <<END

grammar.cpp: grammar.y
	bison -o grammar.cpp grammar.y
END
end
