---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Dylan Malandain.
--- DateTime: 27/02/2019 12:49
---

---@type table
UIProgressBarItem = setmetatable({}, UIProgressBarItem)

---@type table
UIProgressBarItem.__index = UIProgressBarItem

---@type table
UIProgressBarItem.__call = function()
    return "UIProgressBarItem"
end

---New
---@param Text string
---@param X number
---@param Y number
---@param Heading number
---@param R number
---@param G number
---@param B number
---@param A number
function UIProgressBarItem.New(Text, X, Y, Heading, R, G, B, A)
    local X, Y = tonumber(X) or 800, tonumber(Y) or 1030
    if Heading ~= nil then
        Heading = tonumber(Heading) or 0
    else
        Heading = 0
    end
    if R ~= nil then
        R = tonumber(R) or 255
    else
        R = 255
    end
    if G ~= nil then
        G = tonumber(G) or 255
    else
        G = 255
    end
    if B ~= nil then
        B = tonumber(B) or 255
    else
        B = 255
    end
    if A ~= nil then
        A = tonumber(A) or 100
    else
        A = 100
    end

    local _UIProgressBarItem = {
        Background = UIResRectangle.New(0, 0, 350, 40, 0, 0, 0, 100),
        Text = UIResText.New(Text or "N/A", 0, 0, 0.35, 255, 255, 255, 255, 0, "Centre"),
        ProgressBar = UIResRectangle.New(0, 0, 0, 30, R, G, B, A),
        Position = { X = X, Y = Y },
    }
    return setmetatable(_UIProgressBarItem, UIProgressBarItem)
end

---SetPercentage
---@param Number number
function UIProgressBarItem:SetPercentage(Number)
    if (Number <= 100) then
        self.ProgressBar.Width = Number * 3.4
    else
        self.ProgressBar.Width = 100 * 3.4
    end
end

function UIProgressBarItem:GetPercentage()
    return math.floor(self.ProgressBar.Width * 1 / 3.4)
end

---SetText
---@param String string
function UIProgressBarItem:SetText(String)
    self.Text:Text(String)
end

---SetTextColors
---@param R number
---@param G number
---@param B number
---@param A number
function UIProgressBarItem:SetTextColor(R, G, B, A)
    if R ~= nil then
        R = tonumber(R) or 255
    else
        R = 255
    end
    if G ~= nil then
        G = tonumber(G) or 255
    else
        G = 255
    end
    if B ~= nil then
        B = tonumber(B) or 255
    else
        B = 255
    end
    if A ~= nil then
        A = tonumber(A) or 255
    else
        A = 255
    end
    self.Text:Colour(R, G, B, A)
end

---SetBackgroundProgressColor
---@param R number
---@param G number
---@param B number
---@param A number
function UIProgressBarItem:SetBackgroundProgressColor(R, G, B, A)
    if R ~= nil then
        R = tonumber(R) or 0
    else
        R = 0
    end
    if G ~= nil then
        G = tonumber(G) or 0
    else
        G = 0
    end
    if B ~= nil then
        B = tonumber(B) or 0
    else
        B = 0
    end
    if A ~= nil then
        A = tonumber(A) or 100
    else
        A = 100
    end
    self.Background:Colour(R, G, B, A)
end

---SetProgressColor
---@param R number
---@param G number
---@param B number
---@param A number
function UIProgressBarItem:SetProgressColor(R, G, B, A)
    if R ~= nil then
        R = tonumber(R) or 32
    else
        R = 32
    end
    if G ~= nil then
        G = tonumber(G) or 120
    else
        G = 120
    end
    if B ~= nil then
        B = tonumber(B) or 32
    else
        B = 32
    end
    if A ~= nil then
        A = tonumber(A) or 150
    else
        A = 150
    end
    self.ProgressBar:Colour(R, G, B, A)
end

---Draw
function UIProgressBarItem:Draw()
    self.Background:Position(self.Position.X, self.Position.Y)
    self.Text:Position(self.Position.X + 170.0, self.Position.Y + 5)
    self.ProgressBar:Position(self.Position.X + 5.0, self.Position.Y + 5)
    self.Background:Draw()
    self.Text:Draw()
    self.ProgressBar:Draw()
end
