{-# LANGUAGE ScopedTypeVariables, NumericUnderscores, PartialTypeSignatures #-}
{-# OPTIONS_GHC -Wno-partial-type-signatures #-}
module RetroClash.Clock
    ( risePeriod
    , riseRate
    ) where

import Clash.Prelude

risePeriod
    :: forall ps dom. (HiddenClockResetEnable dom, _)
    => SNat ps
    -> Signal dom Bool
risePeriod _ = riseEvery (SNat @(ClockDivider dom ps))

riseRate
    :: forall rate dom. (HiddenClockResetEnable dom, _)
    => SNat rate
    -> Signal dom Bool
riseRate _ = risePeriod (SNat @(HzToPeriod rate))
