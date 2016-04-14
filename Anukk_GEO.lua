-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
	--include('Mote-Include.lua')  
	
    -- VARIABLES --
    auto_action = 'Off'
	geo_mode = 'Fury'	
	
	windower.register_event('tp change', function(new, old)
        if new > 349
        and auto_action == 'On' then
            relaxed_play_mode()
        end
    end)

    windower.register_event('time change', function(time)
        if auto_action == 'On' then
            relaxed_play_mode()
        end
    end)
	
	
	
 --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast = {}
    sets.precast.JA = {}	
    sets.precast.JA.Bolster = {body="Bagua Tunic"}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic"}
	sets.precast.JA['Full cycle'] = {head="Azimuth Hood +1"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua sandals"}
	
    -- Fast cast sets for spells

    sets.precast.FastCast = {range="Dunna",
        head="Merlinic hood", ear1="Etiolation Earring", ear2="Loquacious Earring",
        body="Vrikodara Jupon", ring1="Lebeche Ring", hands="Amalric gages",
        back="Lifestream Cape",waist="Cetl Belt",legs="Geomancy Pants",feet="Merlinic Crackows"}

    --sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Tamaxchi",sub="Sors Shield",back="Pahtli Cape"})

    --sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua mitaines"})

    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Amar cluster",
        head="Merlinic hood",neck="Fotia gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
        body="Hagondes Coat +1",hands="Amalric gages",ring1="Rajas Ring",ring2="Rufescent Ring",
        back="Rancorous Mantle",waist="Fotia Belt",legs="Amalric slops",feet="Battlecast Gaiters"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Flash Nova'] = {ammo="Witchstone",
        head="Merlinic hood",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Barkarole Earring",
        body="Amalric doublet",hands="Amalric gages",ring1="Acumen Ring",ring2="Etana ring",
        back="Toro Cape",waist="Fotia Belt", legs="Amalric slops", feet="Merlinic Crackows"}

    sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}

    sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Base fast recast for spells
    sets.midcast = {}
    sets.midcast.FastRecast = {
        head="Merlinic hood",ear2="Loquacious Earring",
        body="Vrikodara Jupon",hands="Geomancy Mitaines +1",ring1="Prolix Ring",
        back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Merlinic Crackows"}

    sets.midcast.Geomancy = {main="Rubicundity", sub="Culminus", range="Dunna", 
		head="Azimuth Hood", body="Bagua Tunic", hands="Geomancy Mitaines +1", lear="Mendi. Earring", rear="Gifted earring", 
		neck="Incanter's torque", rring="Renaye Ring", feet="Medium's sabots", back="Lifestream Cape"}
    sets.midcast.Geomancy.Indi = {main="Rubicundity", sub="Culminus", range="Dunna", 
		head="Azimuth Hood", body="Bagua Tunic", lear="Mendi. Earring", rear="Gifted earring", neck="Incanter's torque",
		legs="Bagua Pants", hands="Geomancy Mitaines +1", feet="Medium's sabots", back="Lifestream Cape"}

    sets.midcast.Cure = {main="Tamaxchi",sub="Sors Shield", lear="Novia Earring", rear="Mendicant's Earring",
        head="Merlinic hood", body="Vrikodara Jupon",hands="Telchine Gloves", lring="Sirona's ring", rring="Lebeche ring",
        waist="Ovate Rope", back="Cheviot Cape", legs="Assiduity Pants +1",feet="Medium's sabots"}
    
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Protectra = {ring1="Sheltered Ring"}

    sets.midcast.Shellra = {ring1="Sheltered Ring"}

    sets.midcast['Enhancing Magic'] = {
        head="Befouled Crown", neck="Incanter's torque", ear1="Etiolation Earring", ear2="Loquacious Earring",
        body="Telchine Chasuble",hands="Amalric gages", lring="Etana ring", rring="Leviathan ring",
        back="Merciful Cape",waist="Refoccilation Stone",legs="Assiduity Pants +1", feet="Azimuth Gaiters +1"}

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash", neck="Stone gorget"})
    
    sets.midcast['Enfeebling Magic'] = {main="Rubicundity", sub="Culminus", range="Dunna",
				head="Befouled Crown", neck="Sanctity Necklace", rear="Lifestorm Earring", lear="Psystorm Earring",
                body="Vanya Robe", hands="Amalric gages", lring="Etana ring", rring="Leviathan ring",
                back="Lifestream Cape", waist="Ovate Rope", legs="Psycloth Lappas", feet="Bagua Sandals"}
    
    sets.midcast['Elemental Magic'] = {main="Rubicundity", sub="Culminus", ammo="Witchstone",
				head="Merlinic hood", neck="Sanctity Necklace", lear="Barkarole Earring", rear="Friomisi Earring",
                body="Amalric doublet", hands="Amalric gages", lring="Acumen Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Refoccilation Stone", legs="Amalric slops", feet="Merlinic Crackows"}
        
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    sets.midcast['Dark Magic'] = {main="Rubicundity", sub="Culminus", range="Dunna",
				head="Bagua Galero", neck="Incanter's torque", rear="Lifestorm Earring", lear="Psystorm Earring",
                body="Geomancy Tunic", hands="Amalric gages", lring="Acumen Ring", rring="Etana ring",
                back="Lifestream Cape", waist="Cetl Belt", legs="Amalric slops", feet="Merlinic Crackows"}

    sets.magic_burst = {main="Rubicundity", sub="Culminus", ammo="Witchstone",
				head="Merlinic hood", neck="Mizu. Kubikazari", lear="Barkarole Earring", rear="Friomisi Earring",
                body="Amalric doublet", hands="Amalric gages", lring="Mujin Band", rring="Locus ring",
                back="Seshaw cape", waist="Refoccilation Stone", legs="Amalric slops", feet="Merlinic Crackows"}
	
				
	sets.obi = {
		Fire = {waist="Karin Obi"},
		Earth = {waist="Dorin Obi"},
		Water = {waist="Suirin Obi"},
		Wind = {waist="Furin Obi"},
		Ice = {waist="Hyorin Obi"},
		Lightning = {waist="Rairin Obi"},
		Light = {waist="Korin Obi"},
		Dark = {waist="Anrin Obi"},
		}				
				
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {main="Pluto's Staff", range="Dunna",
				head="Azimuth Hood +1", neck="Sanctity Necklace", rear="Etiolation Earring", lear="Ethereal Earring",
                body="Amalric doublet", hands="Bagua Mitaines", lring="Paguroidea Ring", rring="Renaye Ring",
                back="Toro Cape", waist="Refoccilation Stone", legs="Assiduity Pants +1", feet="Azimuth Gaiters +1"}

    -- Idle sets

    sets.idle = {main="Earth Staff", sub="Volos Strap", range="Dunna",
        head="Vanya Hood",neck="Cloud Hairpin +1",ear1="Handler's Earring +1", ear2="Impregnable Earring",
        body="Vanya Robe",hands="Geomancy Mitaines +1", lring="Paguroidea Ring", rring="Gelatinous Ring +1",
        back="Cheviot Cape",waist="Slipor sash",legs="Assiduity Pants +1",feet="Wayfarer Clogs"}

    sets.idle.PDT = {main="Earth Staff", sub="Volos Strap", range="Dunna",
        head="Vanya Hood",neck="Cloud Hairpin +1",ear1="Handler's Earring +1", ear2="Impregnable Earring",
        body="Vanya Robe",hands="Geomancy Mitaines +1", lring="Paguroidea Ring", rring="Gelatinous Ring +1",
        back="Cheviot Cape",waist="Slipor sash",legs="Assiduity Pants +1",feet="Wayfarer Clogs"}

    -- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {main="Earth Staff", sub="Volos Strap", range="Dunna",
        head="Vanya Hood",neck="Cloud Hairpin +1",ear1="Handler's Earring +1", ear2="Impregnable Earring",
        body="Vanya Robe",hands="Geomancy Mitaines +1", lring="Paguroidea Ring", rring="Gelatinous Ring +1",
        back="Cheviot Cape",waist="Slipor sash",legs="Assiduity Pants +1",feet="Wayfarer Clogs"}
   
    sets.idle.PDT.Pet = {main="Earth Staff", sub="Volos Strap", range="Dunna",
        head="Vanya Hood",neck="Cloud Hairpin +1",ear1="Handler's Earring +1", ear2="Impregnable Earring",
        body="Vanya Robe",hands="Geomancy Mitaines +1", lring="Paguroidea Ring", rring="Gelatinous Ring +1",
        back="Cheviot Cape",waist="Slipor sash",legs="Assiduity Pants +1",feet="Wayfarer Clogs"}

    -- .Indi sets are for when an Indi-spell is active.
    --sets.idle.Indi = set_combine(sets.idle, {legs="Bagua Pants"})
    --sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {legs="Bagua Pants"})
    --sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {legs="Bagua Pants"})
    --sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {legs="Bagua Pants"})

    sets.idle.Town = {main="Rubicundity", sub="Culminus", range="Dunna",
        head="Befouled Crown",neck="Sanctity Necklace",rear="Etiolation Earring", lear="Handler's Earring +1",
        body="Amalric doublet",hands="Bagua Mitaines", lring="Paguroidea Ring", rring="Renaye Ring",
        back="Lifestream Cape",waist="Refoccilation Stone",legs="Assiduity Pants +1",feet="Geomancy Sandals +1"}

    sets.idle.Weak = {main="Earth Staff", sub="Volos Strap", range="Dunna",
        head="Vanya Hood",neck="Cloud Hairpin +1",ear1="Handler's Earring +1", ear2="Impregnable Earring",
        body="Vanya Robe",hands="Geomancy Mitaines +1", lring="Paguroidea Ring", rring="Gelatinous Ring +1",
        back="Cheviot Cape",waist="Slipor sash",legs="Assiduity Pants +1",feet="Wayfarer Clogs"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main="Rubicundity", sub="Culminus", ammo="Amar cluster",
        head="Merlinic hood",neck="Sanctity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Hagondes Coat +1",hands="Amalric gages",ring1="Rajas Ring",ring2="Mars's Ring",
        back="Kayapa Cape",waist="Windbuffet Belt +1",legs="Amalric slops",feet="Battlecast Gaiters"}
	
	
end

do
    --[[ Author: Arcon
            The three next "do" sections are used to aid in checking recast
            times, can check multiple recast times at once ]]
    local cache = {}

    function j(str)
        if not cache[str] then
            cache[str] = gearswap.res.job_abilities:with('name', str)
        end

        return cache[str]
    end
end

do
    local cache = {}

    function s(str)
        if not cache[str] then
            cache[str] = gearswap.res.spells:with('name', str)
        end

        return cache[str]
    end
end

do
    local ja_types = S(gearswap.res.job_abilities:map(table.get-{'type'}))

    function check_recasts(...)
        local spells = S{...}

        for spell in spells:it() do
            local fn = 'get_' .. (ja_types:contains(spell.type)
                    and 'ability'
                    or 'spell') ..'_recasts'
            if windower.ffxi[fn]()[spell.recast_id] > 0 then
                return false
            end
        end

        return true
    end
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    indi_timer = ''
    indi_duration = 180
	
	
	    -- VARIABLES --
    auto_action = 'Off'
	geo_mode = 'Fury'	
	
	windower.register_event('tp change', function(new, old)
        if new > 349
        and auto_action == 'On' then
            relaxed_play_mode()
        end
    end)

    windower.register_event('time change', function(time)
        if auto_action == 'On' then
            relaxed_play_mode()
        end
    end)
	
	
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

	state.MagicBurst = M(false, 'Magic Burst')
 
    -- Additional local binds
    send_command('bind ^` gs c toggle MagicBurst')
end

function self_command(str)
    -- Use an in game macro "/con gs c auto_action" to toggle bot Off and On
							--macro: "/con send Anukk gs c auto_action"
    if str == 'auto_action' then
		if auto_action == 'Off' then
			auto_action = 'On'
		else
			auto_action  = 'Off'
		end
		windower.add_to_chat(8,'Auto fire event set to: '..auto_action)
		windower.send_command('input /tell Amunaptra Auto_action: '..auto_action)
		
	elseif str == 'geo_mode' then
		if geo_mode == 'Fury' then
			geo_mode = 'Attunement'
		elseif geo_mode == 'Attunement' then
			geo_mode = 'Acumen'
		else
			geo_mode = 'Fury'
		end		
		windower.add_to_chat(8,'Geo set mode: '..geo_mode)		
		windower.send_command('input /tell Amunaptra Geo_mode: '..geo_mode)
		
	elseif str == 'entrust_acc' then
		if not check_buffs('silence', 'mute')
		and check_recasts(s('Indi-Precision'))
		and check_recasts(s('Entrust')) then
			windower.send_command('Entrust <me>;wait 1;Indi-Precision <p1>')				
		end
		
	elseif str == 'entrust_focus' then
		if not check_buffs('silence', 'mute')
		and check_recasts(s('Indi-Focus'))
		and check_recasts(s('Entrust')) then
			windower.send_command('Entrust <me>;wait 1;Indi-Focus <p1>')				
		end		

	elseif str == 'entrust_fury' then
		if not check_buffs('silence', 'mute')
		and check_recasts(s('Indi-Fury'))
		and check_recasts(s('Entrust')) then
			windower.send_command('Entrust <me>;wait 1;Indi-Fury <p1>')				
		end	

	elseif str == 'entrust_haste' then
		if not check_buffs('silence', 'mute')
		and check_recasts(s('Indi-Haste'))
		and check_recasts(s('Entrust')) then
			windower.send_command('Entrust <me>;wait 1;Indi-Haste <p1>')				
		end	
		
	end
end
	
function relaxed_play_mode()
    -- This can be used as a mini bot to automate actions
    if not midaction() then
        if player.hpp < 70
                and not check_buffs('silence', 'mute')
                and check_recasts(s('cure4')) then
				windower.send_command('cure4 <me>')
				
		elseif player.hpp > 90 
                and player.mpp < 10
                and check_recasts(s('Convert')) then
				windower.send_command('Convert;wait 1;cure4 <me>')
				
		elseif not check_buffs('Refresh')
                and not check_buffs('silence', 'mute')
                and check_recasts(s('Refresh')) then
				windower.send_command('Refresh <me>')
				
        elseif not check_buffs('Stoneskin')
                and not check_buffs('silence', 'mute')
                and check_recasts(s('Stoneskin')) then
				windower.send_command('Stoneskin')			
								
		--geo_mode: Fury
		elseif not check_buffs('Attack Boost')
                and not check_buffs('silence', 'mute')
				and geo_mode == 'Fury'
                and check_recasts(s('Indi-Fury')) then
				windower.send_command('Indi-Fury')
			
		elseif not pet.isvalid
				and not check_buffs('silence', 'mute')
				and check_recasts(s('Geo-Frailty'))
				and player.mp > 305
				and geo_mode == 'Fury' then
				windower.send_command('wait 1;Geo-Frailty <bt>;wait 7;Dia2 <bt>')			
		
		--geo_mode: Attunement
		elseif not check_buffs('Magic Evasion Boost')
                and not check_buffs('silence', 'mute')
				and geo_mode == 'Attunement'
                and check_recasts(s('Indi-Attunement')) then
				windower.send_command('Indi-Attunement')
			
		elseif not pet.isvalid
		        and not check_buffs('silence', 'mute')
				and check_recasts(s('Geo-Vex'))
				and player.mp > 302
				and geo_mode == 'Attunement' then
				windower.send_command('wait 1;Geo-Vex <bt>;wait 7;Dia2 <bt>')

		--geo_mode: Acumen
		elseif not check_buffs('Magic Atk. Boost')
                and not check_buffs('silence', 'mute')
				and geo_mode == 'Acumen'
                and check_recasts(s('Indi-Acumen')) then
				windower.send_command('Indi-Acumen')
			
		elseif not pet.isvalid
				and not check_buffs('silence', 'mute')
				and check_recasts(s('Geo-Malaise'))
				and player.mp > 379
				and geo_mode == 'Acumen' then
				windower.send_command('wait 1;Geo-Malaise <bt>;wait 7;Dia2 <bt>')														
			
        end
    end
end

function relaxed_play_mode2()
    -- Skillup Elemental/Enfeebling/Dark su Uraganites
    if not midaction() then
        if player.hpp < 70
                and not check_buffs('silence', 'mute')
                and check_recasts(s('cure4')) then
				windower.send_command('cure4 <me>')

		elseif player.hpp > 90 
                and player.mpp < 10
                and check_recasts(s('Convert')) then
				windower.send_command('Convert;wait 1;cure4 <me>')	
     			
		elseif not check_buffs('Refresh')
                and not check_buffs('silence', 'mute')
                and check_recasts(s('Refresh')) then
				windower.send_command('Refresh <me>')
			
		elseif not pet.isvalid
		        and not check_buffs('silence', 'mute') then
				windower.send_command('fire <bt>')
				--windower.send_command('dia <bt>')
				--windower.send_command('bio <bt>')
		
	
							
        end
    end
end

function relaxed_play_mode3()
    -- Skillup Elemental/Enfeebling/Dark su Uraganites
				windower.send_command('input /item "Silt Pouch" <me>;wait 2')

end
	
-- Define sets and vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        end
    end
end


function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    local msg = 'Offense'
    msg = msg .. ': [' .. state.OffenseMode.value .. '], '
    msg = msg .. 'Casting'
    msg = msg .. ': [' .. state.CastingMode.value .. '], '
    msg = msg .. 'Idle'
    msg = msg .. ': [' .. state.IdleMode.value .. '], '

    if state.MagicBurst.value == true then
        msg = msg .. 'Magic Burst: [On]'
    elseif state.MagicBurst.value == false then
        msg = msg .. 'Magic Burst: [Off]'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end

function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == "Magic" then
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.obi[spell.element])
        end
    end
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
end

function check_buffs(...)
    --[[ Function Author: Arcon
            Simple check before attempting to auto activate Job Abilities that
            check active buffs and debuffs ]]
    return table.any({...}, table.get+{buffactive})
end

function check_set_spells(...)

    --[[ Function Author: Arcon
            Used to pull list of currently set spells, this is useful for
            determining traits such as Dual Wield IV
            Also used to determine the Cure spell set, when used with a
            self_command ]]
    set_spells = set_spells
        or gearswap.res.spells:type('BlueMagic'):rekey('name')
        return table.all({...}, function(name)
        return S(windower.ffxi.get_mjob_data().spells)
        :contains(set_spells[name].id)
    end)
end

function gear_modes()
    -- User created bridge for aftercast and status_change functions
    -- Sequential gear sets used to easily allow for changing player needs
    --slot_disabling()

    local attack_preference = 'null'

    if player.status == 'Engaged' then
        --[[ This will adjust the amount of Dual Wield used based on if Magic
                Haste is capped from March song, It is assumed that March is
                sung with an instrument that will allow you to hit the cap ]]
        if (check_buffs('Haste') and check_buffs('March')) or
                    (check_buffs('Haste') and check_buffs('Mighty Guard')) or
                    buffactive.haste == 2 then
            attack_preference = 'Multiattack'
        else
            attack_preference = 'Dual Wield'
        end
        equip(sets.engaged)
    elseif player.status == 'Idle' then
        equip(sets.idle)
        if dt_mode == 'None' then
            --print(party.count)
            if party.count > 1 then
                equip(sets.idle.SphereRefresh)
            end
            if player.mpp < 50 then
                equip(sets.idle.under_50mpp)
            end
            if check_buffs('Reive Mark') then
                equip(sets.misc.Reive)
            end
        end
    end

   -- Will inform you if no weapon is equiped and re-equip once able
    if player.equipment.main == 'empty' then
        equip(sets.weapon[weapon_combo])
        windower.add_to_chat(8,'No Weapon, trying to re-equip: '..weapon_combo)
    end
end

function precast(spell,arg)
    gear_change_ok = false
    slot_disabling()


    --[[ Generic equip command for Job Abilities and Weaponskills that have
            a gear set listed in get_sets()
            If Idle and a weaponskill macro is pressed you will change to
            current Idle/DT set, useful as a fast way to equip proper gear
            For then in game macros the quotations("") and <t> aren't needed
            EX: /ws Expiacion ]]
    if sets.precast.JA[spell.name] then
        equip(sets.precast.JA[spell.name])
    elseif sets.precast.WS[spell.name] then
        if player.status == 'Engaged' then
            equip(sets.precast.WS[spell.name])
            if check_buffs('Reive Mark') then
                equip(sets.misc.Reive)
            end
        else
            cancel_spell()
            gear_modes()
            return
        end
    end

    -- Magic spell gear handling(Precast)
    if spell.prefix == '/magic'
            or spell.prefix == '/ninjutsu'
            or spell.prefix == '/song' then
        if spell.type == 'BlueMagic' then
            equip(sets.precast.FastCast.BlueMagic)
        else
            equip(sets.precast.FastCast)
        end
        if spell.name == 'Utsusemi: Ichi'
                and check_recasts(spell)
                and shadow_type == 'Ni' then
            if check_buffs(
                    'Copy Image',
                    'Copy Image (2)',
                    'Copy Image (3)') then
                windower.send_command('cancel copy image;'
                    ..'cancel copy image (2); cancel copy image (3)')
            end
        elseif (spell.name == 'Monomi: Ichi' or spell.name == 'Sneak')
                and check_buffs('Sneak')
                and check_recasts(spell)
                and spell.target.type == 'SELF' then
            windower.send_command('cancel sneak')
        elseif (spell.name == 'Diamondhide'
                or spell.name == 'Metallic body'
                or spell.name == 'Stoneskin')
                and check_buffs('Stoneskin')
                and check_recasts(spell) then
            windower.send_command('cancel stoneskin')
        end
    end

    -- Dancer Sub Job
    if spell.name == 'Spectral Jig'
            and check_buffs('Sneak')
            and check_recasts(spell) then
        windower.send_command('cancel sneak')
        cast_delay(0.3)
    elseif windower.wc_match(spell.name,'*Step') then
        equip(sets.TP['Accuracy High'])
    end
end

function midcast(spell,arg)
    -- Special handling for Spell Mappings outlined in get_maps()
    local stat
	
	if spell.english:startswith('Indi') or spell.english:startswith('Geo') then
		equip(sets.midcast.Geomancy)

    if spell.skill == 'Healing Magic' or spell.skill == 'Enhancing Magic'
            or spell.type == 'Trust' then
        equip(sets.midcast.FastRecast)
        if spell.name:startswith('Cure') then
            equip(sets.midcast.Cure)
            if spell.target.type == 'SELF' then
                equip(sets.midcast.Cure)
            end
        end
    elseif spell.skill == 'Elemental Magic' then
        equip(sets.midcast.BlueMagic.Nuke)
    end

    if spell.name:startswith('Utsusemi') then
        equip(sets.misc.DT.Active)
    end
end

end

function aftercast(spell,arg)
    gear_change_ok = true
    gear_modes()

    -- Gear info, useful if using DressUp or BlinkMeNot

    if not spell.interrupted then
        -- Changes shadow type variable to allow cancel Copy Image
        -- if last cast was Utsusemi: Ni
        if spell.name == 'Utsusemi: Ni' then
            shadow_type = 'Ni'
        elseif spell.name == 'Utsusemi: Ichi' then
            shadow_type = 'Ichi'
        end

        -- If you have spells under a different macro set in game this will let
        -- you change to that set quickly and then change back once finished
        if spell.name:startswith('Unbridled') then
            windower.send_command('input /macro set 3')
        end

        -- TIMERS PLUGIN: Dream Flower
        if spell.name == 'Dream Flower' then
            windower.add_to_chat(8,'NOTE: 1:30 general timer set, '
                ..'max sleep can last 2:00')
            windower.send_command('timers c "Dream Flower" 90 down'
                ..'spells/00521.png')
        end

        -- TIMERS PLUGIN: Since Aftermath: Lv.1 can overwrite itself this
        -- will delete and re-create this specific timer
        if spell.name == 'Expiacion' and player.equipment.main == 'Tizona'
                and check_buffs('Aftermath: Lv.1') then
            windower.send_command('timers d "Aftermath: Lv.1"; wait 0.3;'
                ..'timers c "Aftermath: Lv.1" 90 down abilities/00027.png')
        end
    end
end

function slot_disabling()
    -- Disable slots for items you don't want removed when performing actions
    if player.equipment.head == 'Reraise Hairpin' then
        disable('head')
        windower.add_to_chat(8,'Reraise Hairpin equiped on head')
    else
        enable('head')
    end

    if player.equipment.left_ear == 'Reraise Earring' then
        disable('left_ear')
        windower.add_to_chat(8,'Reraise Earring equiped on left ear')
    else
        enable('left_ear')
    end

    if player.equipment.right_ear == 'Reraise Earring' then
        disable('right_ear')
        windower.add_to_chat(8,'Reraise Earring equiped on right ear')
    else
        enable('right_ear')
    end

    --[[ count_msg_mecisto can be adjusted to the value you want for periodic
            reminders that you have slot locked, count is incresed twice by
            most actions due to slot_disabling() being called in precast
            and again after the cast in gear_modes() ]]
    if player.equipment.back == 'Mecisto. Mantle' then
        disable('back')
        if count_msg_mecisto == 0 then
            windower.add_to_chat(8,'REMINDER:  '
                ..'Mecistopins mantle equiped on back')
        end
        count_msg_mecisto = (count_msg_mecisto + 1) % 30
    else
        enable('back')
        count_msg_mecisto = 0
    end
end

function status_change(new,old)
    if T{'Idle','Engaged'}:contains(new) and gear_change_ok then
        gear_modes()
    end
end