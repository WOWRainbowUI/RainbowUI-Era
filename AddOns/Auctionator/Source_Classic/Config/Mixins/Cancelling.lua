AuctionatorConfigCancellingFrameMixin = CreateFromMixins(AuctionatorPanelConfigMixin)

function AuctionatorConfigCancellingFrameMixin:OnLoad()
  Auctionator.Debug.Message("AuctionatorConfigCancellingFrameMixin:OnLoad()")

  self.name = AUCTIONATOR_L_CONFIG_CANCELLING_CATEGORY
  self.parent = AUCTIONATOR_L_ADDON_OPTIONS

  self:SetupPanel()
end

function AuctionatorConfigCancellingFrameMixin:ShowSettings()
  self.UndercutItemsAhead:SetNumber(Auctionator.Config.Get(Auctionator.Config.Options.UNDERCUT_ITEMS_AHEAD))

  self.CancelUndercutShortcut:SetShortcut(Auctionator.Config.Get(Auctionator.Config.Options.CANCEL_UNDERCUT_SHORTCUT))
end

function AuctionatorConfigCancellingFrameMixin:Save()
  Auctionator.Debug.Message("AuctionatorConfigCancellingFrameMixin:Save()")

  Auctionator.Config.Set(Auctionator.Config.Options.UNDERCUT_ITEMS_AHEAD, math.min(self.UndercutItemsAhead:GetNumber(), 50))

  Auctionator.Config.Set(Auctionator.Config.Options.CANCEL_UNDERCUT_SHORTCUT, self.CancelUndercutShortcut:GetShortcut())
end

function AuctionatorConfigCancellingFrameMixin:Cancel()
  Auctionator.Debug.Message("AuctionatorConfigCancellingFrameMixin:Cancel()")
end
