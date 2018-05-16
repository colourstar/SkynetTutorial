local skynet = require "skynet"
require 'skynet.manager'

print('echo => run')
local command = {}

function command.HELLO(what)
    return 'i am echo server and get this:' .. what
end

function dispatcher()
    print('echo => dispatcher')
    skynet.dispatch('lua',
        function( session, address, cmd, ...)
            cmd = cmd:upper()
            if (cmd == "HELLO") then
                local f = command[cmd]
                assert(f)
                skynet.ret(skynet.pack(f(...)))
            end
        end
    )

    print('echo => register')
    skynet.register('echo')
end

print('echo => skynet.start')
skynet.start(dispatcher)