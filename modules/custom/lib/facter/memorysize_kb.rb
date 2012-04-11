# courtesy Martijn Grendelman on puppet-users mailing list
require 'facter'

Facter.add("memorysize_kb") do
    confine :kernel => :Linux

    ram = 0

    # Steal linux's meminfo
    File.open( "/proc/meminfo" , 'r' ) do |f|
        f.grep( /^MemTotal:/ ) { |mem|
            # originally, this reported MB.  I want KB.
            #ram = mem.split( / +/ )[1].to_i / 1024
            ram = mem.split( / +/ )[1].to_i
        }
    end

    setcode do
        ram
    end
end
