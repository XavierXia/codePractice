local ConfQuery = require 'toolsets.ConfQuery'
require 'toolsets.toolsets_conf'
local ts_budget_client_url = TS_BUDGET_CLIENT_URL

BudgetClientConfQuery = ConfQuery:new({__index = ConfQuery})

function BudgetClientConfQuery:get_conf()
    return self.__index:get_conf(ts_budget_client_url)
end

function BudgetClientConfQuery:handle(ngx)
    self:_handle(ngx)
end

return BudgetClientConfQuery
