springBossTalkList = {}
summerBossTalkList = {}
fallBossTalkList = {}
winterBossTalkList = {}
bossTalkList = {}

function BossTalkLoad()
	springBossTalkList = {SpringBossWarriorTalk1, SpringBossBossTalk1, SpringBossWarriorTalk2, SpringBossBossTalk2, SpringBossWarriorTalk3, SpringBossBossTalk3}
	summerBossTalkList = {SummerBossWarriorTalk1, SummerBossBossTalk1, SummerBossWarriorTalk2, SummerBossBossTalk2, SummerBossWarriorTalk3, SummerBossBossTalk3}
	fallBossTalkList = {FallBossWarriorTalk1, FallBossBossTalk1, FallBossWarriorTalk2, FallBossBossTalk2, FallBossWarriorTalk3, FallBossBossTalk3}
	winterBossTalkList = {WinterBossWarriorTalk1, WinterBossBossTalk1, WinterBossWarriorTalk2, WinterBossBossTalk2, WinterBossWarriorTalk3, WinterBossBossTalk3}
	
	bossTalkList = {springBossTalkList, summerBossTalkList, fallBossTalkList, winterBossTalkList}
end

---------------------------------------------------------------봄 대화
function SpringBossWarriorTalk1() --Warrior Talk 1
	love.graphics.print("마왕이여 이런 곳에 있었군", 45, 32)
end

function SpringBossBossTalk1() --Boss Talk 1

 	love.graphics.print("아니 인간이 어떻게 이곳에 ", 405, 22)
 	love.graphics.print("들어왔지?", 405, 42)
   
end
function SpringBossWarriorTalk2() --Warrior Talk 2
 	love.graphics.print("마왕성 앞의 장애물 따위", 45, 32)
 	love.graphics.print("나에게 아무런 피해를", 45, 52)
 	love.graphics.print("주지 못한다. 마왕이여", 45, 72)
end

function SpringBossBossTalk2() --Boss Talk 2
 	
 	love.graphics.print("'구전으로 내려오는 용사의 ", 405, 42)
 	love.graphics.print("핏줄인 건가'", 405, 62)
end

function SpringBossWarriorTalk3() --Warrior Talk 3
 
 	love.graphics.print("너를 쓰러트리고 세계의 ", 45, 32)
 	love.graphics.print("평화를 되찾을 것이다!", 45, 52)
end

function SpringBossBossTalk3() --Boss Talk 3
 	love.graphics.print("뚫린 입이라고 잘도", 410, 22)
 	love.graphics.print("말하는군 용사여", 410, 42)
 	love.graphics.print("그렇다면 이 문제도", 410, 62)
 	love.graphics.print("풀 수 있을까?", 410, 82)
 	love.graphics.print("흐하하하하하", 410, 102)
end

---------------------------------------------------------------여름 대화
function SummerBossWarriorTalk1() --Warrior Talk 1

 	love.graphics.print("훗. 나에게는 하늘을", 45, 12)
 	love.graphics.print("날 수 있는 날개가 ", 45, 32)
 	love.graphics.print("있기 때문이다!", 45, 52)
end

function SummerBossBossTalk1() --Boss Talk 1

 	love.graphics.print("아니!? 그 미로와", 405, 22)
 	love.graphics.print("하늘의 가시는 어떻게", 405, 42)
 	love.graphics.print("해치고 왔지?", 405, 62)
end

function SummerBossWarriorTalk2() --Warrior Talk 2
 	love.graphics.print("자 마왕이여 이제 ", 45, 12)
 	love.graphics.print("순순히 항복해라", 45, 32)

end

function SummerBossBossTalk2() --Boss Talk 2
 	love.graphics.print("'그래서 나의 여름 ", 405, 22)
 	love.graphics.print("스테이지를 용사가 ", 405, 42)
 	love.graphics.print("빠져 나올 수 있었군'", 405, 62)
end

function SummerBossWarriorTalk3() --Warrior Talk 3
 	love.graphics.print("흥 난 어떤 문제에도 ", 45, 12)
 	love.graphics.print("쉽게 굴복하지 않아!", 45, 32)
end

function SummerBossBossTalk3() --Boss Talk 3
 	love.graphics.print("훗 그동안 너무 ", 405, 22)
 	love.graphics.print("지겨운 세월이었는데 ", 405, 42)
 	love.graphics.print("좀 재미 있어지는군", 405, 62)
 	love.graphics.print("아무리 용사의 핏줄이여도", 405, 82)
 	love.graphics.print("이번은 다를것이다.", 405, 102)
end


---------------------------------------------------------------가을 대화
function FallBossWarriorTalk1() --Warrior Talk 1

 	love.graphics.print("너의 체면 보다 이제 너의", 45, 12)
 	love.graphics.print("목숨을 챙겨야 할 것이다! ", 45, 32)
end

function FallBossBossTalk1() --Boss Talk 1

 	love.graphics.print("이제 가을 스테이지 까지 ", 405, 22)
 	love.graphics.print("오다니 마왕 체면 구기는군", 405, 42)
 	
end

function FallBossWarriorTalk2() --Warrior Talk 2
 	love.graphics.print("칫 불멸자라면서 계속 ", 45, 12)
 	love.graphics.print("도망만 가고 있잖아? ", 45, 32)
 
end

function FallBossBossTalk2() --Boss Talk 2
 	love.graphics.print("나는 마계의 지배자이며 ", 405, 22)
 	love.graphics.print("나는 불멸이다. 필멸자여", 405, 42)
 	love.graphics.print("용사 따위에게 질 수야 없지", 405, 62)
end

function FallBossWarriorTalk3() --Warrior Talk 3
 	love.graphics.print("훗 나도 빠르게 문제를 풀고 널 ", 45, 12)
 	love.graphics.print("이번에야 말로 붙잡을 것이다!", 45, 32)

end

function FallBossBossTalk3() --Boss Talk 3
 	love.graphics.print("이건 작전상 후퇴라는 것이다. ", 405, 22)
 	love.graphics.print("용사여 자 이번에야 말로 널", 405, 42)
 	love.graphics.print("쓰러트려 줄 것이다", 405, 62)
end

---------------------------------------------------------------겨울 대화
function WinterBossWarriorTalk1() --Warrior Talk 1

 	love.graphics.print("Winter Warrior Part1.", 45, 12)
 	love.graphics.print("Winter Warrior Part1.", 45, 32)
 	love.graphics.print("Winter Warrior Part1.", 45, 52)
end

function WinterBossBossTalk1() --Boss Talk 1

 	love.graphics.print("Winter Boss Talk 1", 405, 22)
 	love.graphics.print("Winter Boss Talk 1", 405, 42)
 	love.graphics.print("Winter Boss Talk 1", 405, 62)
end

function WinterBossWarriorTalk2() --Warrior Talk 2
 	love.graphics.print("Winter Warrior Talk 2", 45, 12)
 	love.graphics.print("Winter Warrior Talk 2", 45, 32)
 	love.graphics.print("Winter Warrior Talk 2", 45, 52)
end

function WinterBossBossTalk2() --Boss Talk 2
 	love.graphics.print("Winter Boss Talk 2", 405, 22)
 	love.graphics.print("Winter Boss Talk 2", 405, 42)
 	love.graphics.print("Winter Boss Talk 2", 405, 62)
end

function WinterBossWarriorTalk3() --Warrior Talk 3
 	love.graphics.print("Winter Warrior Talk 3", 45, 12)
 	love.graphics.print("Winter Warrior Talk 3", 45, 32)
 	love.graphics.print("Winter Warrior Talk 3", 45, 52)
end

function WinterBossBossTalk3() --Boss Talk 3
 	love.graphics.print("Winter Boss Talk 3", 405, 22)
 	love.graphics.print("Winter Boss Talk 3", 405, 42)
 	love.graphics.print("Winter Boss Talk 3", 405, 62)
end