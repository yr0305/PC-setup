#Requires AutoHotkey v2.0

; =========================================================
; 단축키: Ctrl + Shift + S (영->한 / 한->영 자동 판단 변환)
; =========================================================
^+s::
{
    ; 기존 클립보드 내용 백업
    savedClip := A_Clipboard
    A_Clipboard := ""

    ; 선택 영역 복사 (Ctrl + C)
    Send "^c"
    if !ClipWait(0.3)
    {
        A_Clipboard := savedClip
        return
    }

    ; 선택된 텍스트에 한글이 있는지 판별하여 양방향 변환
    if IsKorean(A_Clipboard)
        convertedText := KorToEng(A_Clipboard)
    else
        convertedText := EngToKor(A_Clipboard)

    ; 변환된 텍스트 붙여넣기 (Ctrl + V)
    A_Clipboard := convertedText
    Send "^v"

    ; 클립보드 원상복구
    SetTimer () => (A_Clipboard := savedClip), -300
}

; 텍스트 내 한글 포함 여부 확인 함수
IsKorean(str) {
    Loop Parse, str {
        code := Ord(A_LoopField)
        if (code >= 0x3131 && code <= 0xD7A3) ; 한글 자음/모음 및 완성형 범위
            return true
    }
    return false
}

; 한타 -> 영타 변환 함수
KorToEng(str) {
    choArr := ["r","R","s","e","E","f","a","q","Q","t","T","d","w","W","c","z","x","v","g"]
    jungArr := ["k","o","i","O","j","p","u","P","h","hk","ho","hl","y","n","nj","np","nl","b","m","ml","l"]
    jongArr := ["","r","R","rt","s","sw","sg","e","f","fr","fa","fq","ft","fx","fv","fg","a","q","qt","t","T","d","w","c","z","x","v","g"]
    
    ; 낱자 자음/모음 매핑 (ㄱ~ㅎ, ㅏ~ㅣ)
    jamoMap := Map(
        0x3131,"r", 0x3132,"R", 0x3133,"rt", 0x3134,"s", 0x3135,"sw", 0x3136,"sg", 0x3137,"e", 0x3138,"E", 0x3139,"f", 0x313A,"fr", 0x313B,"fa", 0x313C,"fq", 0x313D,"ft", 0x313E,"fx", 0x313F,"fv", 0x3140,"fg", 0x3141,"a", 0x3142,"q", 0x3143,"Q", 0x3144,"qt", 0x3145,"t", 0x3146,"T", 0x3147,"d", 0x3148,"w", 0x3149,"W", 0x314A,"c", 0x314B,"z", 0x314C,"x", 0x314D,"v", 0x314E,"g",
        0x314F,"k", 0x3150,"o", 0x3151,"i", 0x3152,"O", 0x3153,"j", 0x3154,"p", 0x3155,"u", 0x3156,"P", 0x3157,"h", 0x3158,"hk", 0x3159,"ho", 0x315A,"hl", 0x315B,"y", 0x315C,"n", 0x315D,"nj", 0x315E,"np", 0x315F,"nl", 0x3160,"b", 0x3161,"m", 0x3162,"ml", 0x3163,"l"
    )

    res := ""
    Loop Parse, str {
        ch := A_LoopField
        code := Ord(ch)

        if (code >= 0xAC00 && code <= 0xD7A3) { ; 완성형 한글
            idx := code - 0xAC00
            cho := choArr[Floor(idx / 588) + 1]
            jung := jungArr[Floor(Mod(idx, 588) / 28) + 1]
            jong := jongArr[Mod(idx, 28) + 1]
            res .= cho . jung . jong
        } else if (code >= 0x3131 && code <= 0x3163) { ; 낱자 한글
            res .= jamoMap[code]
        } else {
            res .= ch ; 영어나 기호 등은 그대로 유지
        }
    }
    return res
}

; 영타 -> 한타 변환 함수
EngToKor(str) {
    choList := ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
    choMap  := Map("r",0,"R",1,"s",2,"e",3,"E",4,"f",5,"a",6,"q",7,"Q",8,"t",9,"T",10,"d",11,"w",12,"W",13,"c",14,"z",15,"x",16,"v",17,"g",18)

    jungMap := Map("k",0,"o",1,"i",2,"O",3,"j",4,"p",5,"u",6,"P",7,"h",8,"y",12,"n",13,"b",17,"m",18,"l",20)
    doubleJung := Map("8,0",9, "8,1",10, "8,20",11, "13,4",14, "13,5",15, "13,20",16, "18,20",19)

    jongMap := Map("r",1,"R",2,"s",4,"e",7,"f",8,"a",16,"q",17,"t",19,"T",20,"d",21,"w",22,"c",23,"z",24,"x",25,"v",26,"g",27)
    doubleJong := Map("1,19",3, "4,22",5, "4,27",6, "8,1",9, "8,16",10, "8,17",11, "8,19",12, "8,25",13, "8,26",14, "8,27",15, "17,19",18)

    jongToCho := Map(1,0, 2,1, 4,2, 7,3, 8,5, 16,6, 17,7, 19,9, 20,10, 21,11, 22,12, 23,14, 24,15, 25,16, 26,17, 27,18)

    splitJong := Map(
        3, [1, 9],    ; ㄳ
        5, [4, 12],   ; ㄵ
        6, [4, 18],   ; ㄶ
        9, [8, 0],    ; ㄺ
        10, [8, 6],   ; ㄻ
        11, [8, 7],   ; ㄼ
        12, [8, 9],   ; ㄽ
        13, [8, 16],  ; ㄾ
        14, [8, 17],  ; ㄿ
        15, [8, 18],  ; ㅀ
        18, [17, 9]   ; ㅄ
    )

    res := ""
    cCho := -1, cJung := -1, cJong := 0

    flushSyllables() {
        if (cCho != -1 && cJung != -1)
            res .= Chr(0xAC00 + (cCho * 21 + cJung) * 28 + cJong)
        else if (cCho != -1)
            res .= choList[cCho + 1]
        else if (cJung != -1)
            res .= Chr(0x314F + cJung)
        cCho := -1, cJung := -1, cJong := 0
    }

    Loop Parse, str {
        ch := A_LoopField

        if (choMap.Has(ch) || jungMap.Has(ch)) {
            if (jungMap.Has(ch)) {
                jIdx := jungMap[ch]
                if (cCho != -1 && cJung == -1) {
                    cJung := jIdx
                } else if (cJung != -1 && cJong == 0) {
                    key := cJung . "," . jIdx
                    if doubleJung.Has(key)
                        cJung := doubleJung[key]
                    else {
                        flushSyllables()
                        cJung := jIdx
                    }
                } else if (cJong != 0) {
                    prevJong := cJong
                    if splitJong.Has(prevJong) {
                        cJong := splitJong[prevJong][1]
                        nextCho := splitJong[prevJong][2]
                    } else {
                        cJong := 0
                        nextCho := jongToCho[prevJong]
                    }
                    flushSyllables()
                    cCho := nextCho
                    cJung := jIdx
                } else {
                    flushSyllables()
                    cJung := jIdx
                }
            } else if (choMap.Has(ch)) {
                cIdx := choMap[ch]
                if (cCho == -1) {
                    cCho := cIdx
                } else if (cJung == -1) {
                    flushSyllables()
                    cCho := cIdx
                } else if (cJong == 0) {
                    if jongMap.Has(ch)
                        cJong := jongMap[ch]
                    else {
                        flushSyllables()
                        cCho := cIdx
                    }
                } else {
                    key := cJong . "," . (jongMap.Has(ch) ? jongMap[ch] : -1)
                    if doubleJong.Has(key)
                        cJong := doubleJong[key]
                    else {
                        flushSyllables()
                        cCho := cIdx
                    }
                }
            }
        } else {
            flushSyllables()
            res .= ch
        }
    }
    flushSyllables()
    return res
}