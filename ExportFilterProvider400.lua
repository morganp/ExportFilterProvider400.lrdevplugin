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
-- This preset expot settings for a Export Service
local function updateExportSettings( exportSettings ) 
  exportSettings.LR_size_maxHeight = 400
  exportSettings.LR_size_maxWidth  = 400
  exportSettings.LR_size_doConstrain = true
end

-- Override export settings with Export Filter
-- Page 49 to 51 of the SDK guide
-- http://wwwimages.adobe.com/www.adobe.com/content/dam/Adobe/en/devnet/photoshoplightroom/pdfs/lr5/lightroom-sdk-guide.pdf
local function postProcessRenderedPhotos(  functionContext, filterContext )
  -- Optional: If you want to change the render settings for each photo
  -- before Lightroom renders it
  local renditionOptions = {
    filterSettings = function( renditionToSatisfy, exportSettings )
      exportSettings.LR_size_maxHeight = 400
      exportSettings.LR_size_maxWidth  = 400
      exportSettings.LR_size_doConstrain = true
      return os.tmpname()
    end,
  }
  for sourceRendition, renditionToSatisfy in filterContext:renditions( 
    renditionOptions ) do
    -- Wait for the upstream task to finish its work on this photo. 
    local success, pathOrMessage = sourceRendition:waitForRender()
    --if success then 
    --  -- Now that the photo is completed and available to this filter,
    --  -- you can do your work on the photo here.
    --  -- It would look somethinglike this: 
    --  -- local status = LrTasks.execute( 'mytool "' .. pathOrMessage .. '"' )
    --  local status = 1
    --  -- use something like this to signal a failure for this rendition only: 
    --  -- (Replace "error message" with a user-readable string explaining why
    --  -- the photo failed to render.)
    --  if status ~= (desired status) then
    --    renditionToSatisfy:renditionIsDone( false, "error message" )
    --  end
  end
end

--------------------------------------------------------------------------------

return {
sectionForFilterInDialog  = sectionForFilterInDialog,
updateExportSettings      = updateExportSettings    , --Does this works
postProcessRenderedPhotos = postProcessRenderedPhotos,
}

--ExportFilterProvider
