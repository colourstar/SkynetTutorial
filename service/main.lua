local skynet = require('skynet')

print('main => run')
skynet.start(
    function()
        print('main => start')
        local echo = skynet.newservice('echo')
        print(skynet.call(echo,'lua','HELLO','world'))
    end
)