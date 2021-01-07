import random as rand

def type(type_int):
    if (type_int == 1):
        type = "Legend"
    elif (type_int == 2):
        type = "War"
    elif (type_int == 3):
        type = "Secret"
    elif (type_int == 4):
        type = "Trial"
    elif (type_int == 5):
        type = "Age"
    elif (type_int == 6):
        type = "Mystery"
    elif (type_int == 7):
        type = "Legacy"
    elif (type_int == 8):
        type = "Order"
    elif (type_int == 9):
        type = "Realm"
    elif (type_int == 10):
        type = "Ruins"
    elif (type_int == 11):
        type = "Heroes"
    elif (type_int == 12):
        type = "Whispers"
    else:
        type = "ID10T"
    return type      

def adjective(adjective_int):
    if (adjective_int == 1):
        adjective = "Arcane"
    elif (adjective_int == 2):
        adjective = "Silver"
    elif (adjective_int == 3):
        adjective = "Dragon's"
    elif (adjective_int == 4):
        adjective = "Forgotten"
    elif (adjective_int == 5):
        adjective = "Immortal"
    elif (adjective_int == 6):
        adjective = "Ancient"
    elif (adjective_int == 7):
        adjective = "Elder's"
    elif (adjective_int == 8):
        adjective = "Broken"
    elif (adjective_int == 9):
        adjective = "Obsidian"
    elif (adjective_int == 10):
        adjective = "Forbidden"
    elif (adjective_int == 11):
        adjective = "Divine"
    elif (adjective_int == 12):
        adjective = "Ascending"
    elif (adjective_int == 13):
        adjective = "Giant's"
    elif (adjective_int == 14):
        adjective = "Lost"
    elif (adjective_int == 15):
        adjective = "Chaotic"
    elif (adjective_int == 16):
        adjective = "Demon's"
    elif (adjective_int == 17):
        adjective = "Sacred"
    elif (adjective_int == 18):
        adjective = "Burning"
    elif (adjective_int == 19):
        adjective = "Enchanted"
    elif (adjective_int == 20):
        adjective = "Cursed" 
    else:
        adjective = "ID10T"
    return adjective

def noun(noun_int):
    if (noun_int == 1):
        noun = "Crown"
    elif (noun_int == 2):
        noun = "Orb"
    elif (noun_int == 3):
        noun = "Temple"
    elif (noun_int == 4):
        noun = "Sword"
    elif (noun_int == 5):
        noun = "Truth"
    elif (noun_int == 6):
        noun = "Wasteland"
    elif (noun_int == 7):
        noun = "Stronghold"
    elif (noun_int == 8):
        noun = "Ritual"
    elif (noun_int == 9):
        noun = "Forge"
    elif (noun_int == 10):
        noun = "Pyre"
    elif (noun_int == 11):
        noun = "Dynasty"
    elif (noun_int == 12):
        noun = "Tomb"
    elif (noun_int == 13):
        noun = "Symphony"
    elif (noun_int == 14):
        noun = "Horde"
    elif (noun_int == 15):
        noun = "Syndicate"
    elif (noun_int == 16):
        noun = "Gateway"
    elif (noun_int == 17):
        noun = "Kingdom"
    elif (noun_int == 18):
        noun = "Medallion"
    elif (noun_int == 19):
        noun = "Oath"
    elif (noun_int == 20):
        noun = "Forest" 
    else:
        noun = "ID10T"
    return noun

def main():
    type_int = rand.randint(1, 12)
    adjective_int = rand.randint(1, 20)
    noun_int  = rand.randint(1, 20)
    print('{} of the {} {}'.format(type(type_int), adjective(adjective_int), noun(noun_int)))
    
if __name__ == "__main__":
    main()
    