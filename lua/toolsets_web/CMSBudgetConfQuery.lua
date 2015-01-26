local ConfQuery = require 'toolsets.ConfQuery'
require 'toolsets.toolsets_conf'
local ts_cms_budget_url = TS_CMS_BUDGET_URL

CMSBudgetConfQuery = ConfQuery:new({__index = ConfQuery})

function CMSBudgetConfQuery:get_conf()
    return self.__index:get_conf(ts_cms_budget_url)
end

function CMSBudgetConfQuery:handler(ngx)
    self:_handler(ngx)
end

return CMSBudgetConfQuery
