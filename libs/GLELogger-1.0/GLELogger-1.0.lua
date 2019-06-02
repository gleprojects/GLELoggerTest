local MAJOR, MINOR = "GLELogger-1.0", 1
local GLELogger = LibStub:NewLibrary(MAJOR,MINOR)

if not GLELogger then
    return
end

local logLevels = {
    ['ERROR'] = 1,
    ['WARN'] = 2,
    ['INFO'] = 3,
    ['DEBUG'] = 4,
    ['TRACE'] = 5
}

local defaults = {
    ['logLevel'] = 'WARN',
    ['themes'] = {
        ['ERROR'] = {
            r = 1, --255/255
            g = 0.3, -- 79/255
            b = 0.2, -- 51/255
            hex = "00ccff"
        },
        ['WARN'] = {
            r = 1, -- 255/255
            g = 0.6, -- 159/255
            b = 0.2, -- 51/255
            hex = "00ccff"
        },
        ['INFO'] = {
            r = 0.2, -- 51/255
            g = 0.2, -- 25/255
            b = 0.8, --200/255
            hex = "00ccff"
        },
        ['DEBUG'] = {
            r = 0.2, -- 51/255
            g = 0.7, -- 168/255
            b = 1, --255/255
            hex = "00ccff"
        },
        ['TRACE'] = {
            r = 0.6,-- 147/255
            g = 0.2, -- 51/255
            b = 1, -- 255/255
            hex = "00ccff"
        }
    }
}

local function getLoggingLevel(logLevel)
    local level = logLevels[logLevel]
    if (level == nil) then
        level = 2
    end
        
    return level
    
end
local function getThemeColor(logLevel) 
    local c = defaults.themes[logLevel]
    return c;
end

local function showMessage(src,level,msg,theme)
    local themeColor = theme.r..theme.g..theme.b..theme.hex
    --local prefix = string.format("|%s%s|r",themeColor,src);
    local prefix = src
    DEFAULT_CHAT_FRAME:AddMessage(string.join(" ",prefix, "-",level," : ",msg),theme.r, theme.g, theme.b);
end

local function logMessage(src,msg,logLevelText) 
    logLevel = getLoggingLevel(logLevelText)
    currentLogLevel = getLoggingLevel(defaults['logLevel'])
    theme = getThemeColor(logLevelText)
    if (logLevel <= currentLogLevel) then
        showMessage(src,logLevelText,msg,theme)
    end
    
end

function GLELogger:SetLogLevel(newLogLevel)
    defaults['logLevel'] = newLogLevel
end

function GLELogger:ShowLogLevel()
    return defaults['logLevel']
end

function GLELogger:Debug(src,msg)
    logMessage(src,msg,'DEBUG')    
end

function GLELogger:Info(src,msg) 
    logMessage(src,msg,'INFO')
end

function GLELogger:Error(src,msg) 
    logMessage(src,msg,'ERROR')
end

function GLELogger:Warn(src,msg) 
    logMessage(src,msg,'WARN')
end

function GLELogger:Trace(src,msg) 
    logMessage(src,msg,'TRACE')
end