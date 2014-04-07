--[[----------------------------------------------------------------------------

Info.lua
metaExportFilter Sample
Summary information for Metadata Export Filter plugin sample plugin
--------------------------------------------------------------------------------
ADOBE SYSTEMS INCORPORATED
 Copyright 2008 Adobe Systems Incorporated
 All Rights Reserved.

NOTICE: Adobe permits you to use, modify, and distribute this file in accordance
with the terms of the Adobe license agreement accompanying it. If you have received
this file from a source other than Adobe, then your use, modification, or distribution
of it requires the prior written permission of Adobe.
------------------------------------------------------------------------------]]

return {

  LrSdkVersion        = 3.0,
  LrSdkMinimumVersion = 1.3, -- minimum SDK version required by this plugin

  LrPluginName        = "400x400 Export",
  LrToolkitIdentifier = 'sample.export400x400',
  
  LrExportFilterProvider = {
    title = LOC "$$$/SDK/MetaExportFilter/Sample=400x400 Size", -- the string that appears in the export filter section of the export dialog in LR
    file  = 'ExportFilterProvider400.lua', -- name of the file containing the filter definition script
    id    = "metadata1",  -- unique identifier for export filter
  },

  VERSION = { major=5, minor=0, revision=0, build=907681, },

}
