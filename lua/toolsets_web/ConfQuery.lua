Class = require 'shared.base.Class'
local logger = require 'shared.log'
local http = require 'resty.http'

ConfQuery = Class:new()
local insert = table.insert
local cjson = require 'cjson'
local pairs = pairs

local allid = {
    ["line_items_allid"] = "line_items",
    ["creatives_allid"] = "creatives",
    ["campaigns_allid"] = "campaigns",
    ["advertisers_allid"] = "advertisers",
    }

function ConfQuery:get_allid(conf, op)
    local all_id = {}
    logger:log("test", "op, not id :%s", op)
    for k,_ in pairs(conf[op]) do
        insert(all_id, k) 
    end
    logger:log("test", "all_id: %s", cjson.encode(all_id))
    return all_id
end

function ConfQuery:parse_conf(conf, op, id)
    if op == 'worker_id' then return {conf[op]} end
    if op == "info" then return {conf[op]} end
    -- creatives, advertisers, campaigns, line_items has id
    if id then 
        if id == "all" then return conf[op] end
        return conf and conf[op] and conf[op][id] or nil
    else
        logger:log("test","come in parse_conf, else")
        if allid[op] then
            logger:log("test", "allid[op]:%s",tostring(allid[op]))
            return self:get_allid(conf, allid[op])
        end
    end
    return nil
end

function ConfQuery:get_conf(url)
    logger:log("test","url:%s",url)
    local httpc = http.new()
    local res, err = httpc:request_uri(url, {
        method = "GET",
    }) 
    local conf, err 
    if res.status == 200 and res.body then
        conf, err = cjson.decode(res.body)
        if not conf then 
            logger:log("test", 'decode cms data from proxy server, %s', err)
            return nil 
        end 
    else
        logger:log("test","get conf from proxy server error, %s", tostring(res.status))
    end
    --logger:log("test","conf:%s",cjson.encode(conf))
    return conf
end

function ConfQuery:_handle(ngx)
    local params = ngx.req.get_uri_args()
    local op, id = params.op, params.id
    if not op then return ngx.say(cjson.encode(nil)) end
    logger:log("test", "op:%s, id:%s",op,tostring(id))
    ngx.header['Content-Type'] = 'application/json'
    local conf = self:get_conf()
    local strjson = self.__index:parse_conf(conf, op, id)
    ngx.say(cjson.encode(strjson))
end

return ConfQuery
