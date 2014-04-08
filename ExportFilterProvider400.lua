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

--local logger = import 'LrLogger'( 'AnExample' )

-- Creates ~/Documents/myPlugin.log
local LrLogger = import 'LrLogger'
local logger   = LrLogger( 'myPlugin' )
logger:enable( "logfile" )
logger:info('Required ExportFilterProvider400')

--logger:trace('Test Trace' )
--logger:info('Test Info'  )
--logger:warn('Test Warn'  )
--logger:error('Test Err'   )
--------------------------------------------------------------------------------
-- This function will create the section displayed on the export dialog 
-- when this filter is added to the export session.
local function sectionForFilterInDialog( f, propertyTable )
  logger:info('Called sectionForFilterInDialog')
  return {
    title = LOC "$$$/SDK/MetaExportFilter/SectionTitle=400x400 Filter",
  }
end


--------------------------------------------------------------------------------
-- -- Example on updating export settings
-- -- This preset export settings for a Export Service
-- local function updateExportSettings( exportSettings ) 
--   exportSettings.LR_size_maxHeight = 400
--   exportSettings.LR_size_maxWidth  = 400
--   exportSettings.LR_size_doConstrain = true
-- end


local function postProcessRenderedPhotos( functionContext, filterContext )
  logger:info('postProcessRenderedPhotos start')  

  local renditionOptions = {
    filterSettings = function( renditionToSatisfy, exportSettings )
      logger:info('renditionOptions'  )  
      exportSettings.LR_size_maxHeight = 400
      exportSettings.LR_size_maxWidth  = 400
      exportSettings.LR_size_doConstrain = true
    end
  }

  for sourceRendition, renditionToSatisfy in filterContext:renditions( renditionOptions ) do
    logger:info('sourceRendition start')  

    -- Wait for the upstream task to finish its work on this photo. 
    local success, pathOrMessage = sourceRendition:waitForRender()
    
    logger:info('sourceRendition finish')  
  end
  logger:info('postProcessRenderedPhotos finish')  
end
--------------------------------------------------------------------------------

return {
  sectionForFilterInDialog  = sectionForFilterInDialog,
  postProcessRenderedPhotos = postProcessRenderedPhotos,
}

