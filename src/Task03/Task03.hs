module Task03 where
--Задание №3
type OatmealTemp = Int -- OatmealTemp is in Int[0, 20)
-- intetrp. possible oatmeal temperatures

--1)A
coldTemperature :: OatmealTemp
coldTemperature = 0

perfectTemperature :: OatmealTemp
perfectTemperature = 10

hotTemperature :: OatmealTemp
hotTemperature = 19

fnForOatmealTemperature :: OatmealTemp -> a
fnForOatmealTemperature t = (undefined t)

--1)B

data Adjustment = LeftAdjustment | RightAdjustment | StayAdjustment deriving (Show, Eq, Ord)
-- intetrp. state of stove

fnForStoveAdjustment :: Adjustment -> a
fnForStoveAdjustment ad = case ad of
					LeftAdjustment  -> undefined
					RightAdjustment -> undefined
					StayAdjustment  -> undefined


--1)C

oatmealTempToAdjustment :: OatmealTemp -> Adjustment
oatmealTempToAdjustment 0 = RightAdjustment
oatmealTempToAdjustment 10 = StayAdjustment
oatmealTempToAdjustment 19 = LeftAdjustment

--2)A


data DinnerOrder = Chicken | Pasta | Nothink deriving (Show, Eq, Ord)
-- intetrp. dinner oreder for YesItCanFly! airlines passangers
fnForDinnerOrder :: DinnerOrder -> a
fnForDinnerOrder ad = case ad of
					Chicken  -> undefined
					Pasta    -> undefined
					Nothink    -> undefined


flightAttendantSpeech :: String -> String
flightAttendantSpeech msg = "The passenger ordered " ++ msg




dinnerOrderToMsg :: DinnerOrder -> String
dinnerOrderToMsg Chicken = flightAttendantSpeech("Chicken")
dinnerOrderToMsg Pasta = flightAttendantSpeech("Pasta")
--dinnerOrderToMsg Nothink = flightAttendantSpeech("Nothink")