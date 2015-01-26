local ConfQuery = require 'toolsets.ConfQuery'
require 'toolsets.toolsets_conf'
local ts_budget_server_url = TS_BUDGET_SERVER_URL

BudgetServerConfQuery = ConfQuery:new({__index = ConfQuery})

function BudgetServerConfQuery:get_conf()
    return self.__index:get_conf(ts_budget_server_url)
end

function BudgetServerConfQuery:handle(ngx)
    self:_handle(ngx)
end

return BudgetServerConfQuery
