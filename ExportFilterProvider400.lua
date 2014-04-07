--[[----------------------------------------------------------------------------

ExportFilterProvider.lua
metaExportFilter Sample Plugin
ExportFilterProvider for the Metadata Export Filter sample plugin

Defines the dialog section to be displayed in the Export dialog and provides the
filter process before the photos are exported.

--------------------------------------------------------------------------------
ADOBE SYSTEMS INCORPORATED
 Copyright 2008 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE: Adobe permits you to use, modify, and distribute this file in accordance
with the terms of the Adobe license agreement accompanying it. If you have received
this file from a source other than Adobe, then your use, modification, or distribution
of it requires the prior written permission of Adobe.

------------------------------------------------------------------------------]]

local LrView = import 'LrView'
local bind   = LrView.bind
--------------------------------------------------------------------------------
-- This function will create the section displayed on the export dialog 
-- when this filter is added to the export session.

local function sectionForFilterInDialog( f, propertyTable )
  
  return {
    title = LOC "$$$/SDK/MetaExportFilter/SectionTitle=400x400 Filter",
  }
end

--------------------------------------------------------------------------------
-- Example on updating export settings
local function updateExportSettings( exportSettings ) 
  exportSettings.LR_size_maxHeight = 400
  exportSettings.LR_size_maxWidth  = 400
  exportSettings.LR_size_doConstrain = true
end



--------------------------------------------------------------------------------

return {
sectionForFilterInDialog = sectionForFilterInDialog,
updateExportSettings     = updateExportSettings    , --Does this works
}

--ExportFilterProvider
