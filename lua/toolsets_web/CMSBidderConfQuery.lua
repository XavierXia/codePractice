local ConfQuery = require 'toolsets.ConfQuery'
local logger = require "shared.log"

require 'toolsets.toolsets_conf'
local ts_cms_bidder_url = TS_CMS_BIDDER_URL

CMSBidderConfQuery = ConfQuery:new({__index = ConfQuery})

function CMSBidderConfQuery:get_conf()
    return self.__index:get_conf(ts_cms_bidder_url)
end

function CMSBidderConfQuery:handle(ngx)
    logger:log("test", "come in CMSBidderConfQuery")
    self:_handle(ngx)
end

return CMSBidderConfQuery
