-- Copyright 2021 SmartThings
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

--  Copyright 2020 SmartThings
--
--  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
--  in compliance with the License. You may obtain a copy of the License at:
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed
--  on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License
--  for the specific language governing permissions and limitations under the License.

local capabilities = require "st.capabilities"

local function added_handler(self, device)
  device:emit_event(capabilities.button.supportedButtonValues({"pushed"}))
  device:emit_event(capabilities.button.numberOfButtons({value = 1}))
end

local push_button = {
  NAME = "Non holdable Button",
  lifecycle_handlers = {
    added = added_handler,
  },
  sub_drivers = {},
  can_handle = function(opts, driver, device, ...)
    return device:get_manufacturer() == "HEIMAN" and device:get_model() == "SOS-EM"
  end
}

return push_button
