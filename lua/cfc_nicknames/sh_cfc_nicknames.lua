CFCNicknames = {}
CFCNicknames.Delay = 5 -- How often people can change their name
CFCNicknames.TimeOut = {} -- List of players that have recently changed their names
CFCNicknames.Nicks = {}
CFCNicknames.BannedPlayers = {}

CreateConVar( "cfc_nicknames_can_change", 1, FCVAR_NOTIFY, "Enables players to set their own nicknames", 0, 1 )

-- TODO: Have as a ULX flag?
function CFCNicknames:grantNicknameAccess( player )

end

function CFCNicknames:restrictNicknameAccess( player )

end

function CFCNicknames:isAccessRestricted( player )
    if not ( IsValid( player ) and player:IsPlayer() ) then return true end

    for _, sid in pairs( self.BannedPlayers ) do
        if player:SteamID() == sid then
            return true
        end
    end

    return false
end

-- Break up into different file?
local plyMeta = getmetatable( "player" )
function plyMeta:canChangeNickname()
    if not GetConVar( "cfc_sv_nicknames_can_change" ):GetBool() then return false end
    if CFCNicknames:isAccessRestricted( self ) then return false end

    return true
end

function plyMeta:changeNick( nick )

end

-- function plyMeta:Nick()

-- end

function CFCNicknames:onNickChanged( before, after )

end

hook.Add( "CFC_OnChangeNick", CFCNicknames, CFCNicknames.onNickChanged )