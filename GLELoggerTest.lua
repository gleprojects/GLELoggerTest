local Logger = LibStub("GLELogger-1.0")

local function testMsgs()
    local src = "GLELoggerTest"
    Logger:Error(src,"This is an error")
    Logger:Warn(src,"This is a warning")
    Logger:Info(src,"This is an info message")
    Logger:Debug(src,"This is a debug message")
    Logger:Trace(src,"This is a trace message")
end

local function setLogLevel(logLevel) 
    local src = "GLELoggerTest"
    print("Current log level is "..Logger:ShowLogLevel())
    Logger:SetLogLevel(logLevel)
    print("log level is now "..Logger:ShowLogLevel())
    testMsgs()
end



SLASH_GLEL_TEST1 = "/gleltest"
SlashCmdList["GLEL_TEST"] = function()
    testMsgs()
end

SLASH_GLEL_TRACE1 = "/glelTrace"
SlashCmdList["GLEL_TRACE"] = function()
    setLogLevel('TRACE')
end

SLASH_GLEL_DEBUG1 = "/glelDebug"
SlashCmdList["GLEL_DEBUG"] = function()
    setLogLevel('DEBUG')
end

SLASH_GLEL_INFO1 = "/glelInfo"
SlashCmdList["GLEL_INFO"] = function()
    setLogLevel('INFO')
end

SLASH_GLEL_WARN1 = "/glelWarn"
SlashCmdList["GLEL_WARN"] = function()
    setLogLevel('WARN')
end

SLASH_GLEL_ERROR1 = "/glelError"
SlashCmdList["GLEL_ERROR"] = function()
    setLogLevel('ERROR')
end

