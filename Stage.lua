isTutorialClear = true
isSpringClear = true
isSummerClear = true
isFallClear = true
isWinterClear = true

isTutorialClear = true
isSpringClear = false
isSummerClear = false
isFallClear = false
isWinterClear = false

stageClearLevel = 1
stageClearList = {}

function InitStageClear()
	stageClearList = {SpringStageClear, SummerStageClear, FallStageClear, WinterStageClear}
end

function SpringStageClear()
  isSpringClear = true
end

function SummerStageClear()
  isSummerClear = true
end

function FallStageClear()
  isFallClear = true
end

function WinterStageClear()
  isWinterClear = true
end
