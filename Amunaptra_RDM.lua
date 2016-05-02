-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Saboteur = buffactive.saboteur or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')

    gear.default.obi_waist = "Sekhmet Corset"
    
    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {body="Vitivation Tabard"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Atrophy Chapeau +1",
        body="Atrophy Tabard +1",hands="Yaoyotl Gloves",
        back="Refraction Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    -- 80% Fast Cast (including trait) for all spells, plus 5% quick cast
    -- No other FC sets necessary.
    sets.precast.FC = {main="Vampirism", ammo="Ginsen",
		head="Carmine Mask", neck="Sanctity Necklace", rear="Loquac. Earring", lear="Etiolation Earring",
        body="Atrophy Tabard +1", hands="Leyline Gloves", lring="Prolix Ring", feet="Carmine Greaves",
        back="Swith Cape", waist="Witful Belt", legs="Artsieq Hose"}

    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Ginsen",
		head="Carmine mask", neck="Fotia gorget", ear1="Moonshade earring",ear2="Brutal Earring",
		body="Emet Harness +1", hands="Despair Finger Gauntlets", ring1="Ramuh Ring +1", ring2="Mars's Ring",
		back="Rancorous Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Battlecast Gaiters"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, 
        {neck="Fotia Gorget",ear1="Moonshade earring",ear2="Brutal Earring", feet="Carmine Greaves",
        ring2="Leviathan ring", waist="Fotia Belt", ring1="Mars's Ring", ring2="Rufescent Ring"})

    sets.precast.WS['Sanguine Blade'] = {ammo="Witchstone",
		head="Merlinic hood", neck="Sanctity Necklace", lear="Hecate's Earring", rear="Friomisi Earring",
		body="Amalric doublet", hands="Amalric gages", lring="Acumen Ring", rring="Shiva Ring",
		back="Toro Cape", waist="Refoccilation Stone", legs="Amalric slops", feet="Vitivation Boots"}

    sets.precast.WS['Chant du Cygne'] = {ammo="Ginsen",
		head="Carmine mask", neck="Fotia Gorget", ear1="Moonshade earring",ear2="Brutal Earring",
		body="Emet Harness +1", hands="Despair Finger Gauntlets", ring1="Mars's Ring", ring2="Ramuh Ring +1",
		back="Rancorous Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Battlecast Gaiters"}

		
    -- Midcast Sets
    
    sets.midcast.FastRecast = {
        head="Carmine Mask", lear="Etiolation Earring", rear="Loquacious Earring",
        body="Atrophy Tabard +1",hands="Leyline Gloves",ring1="Prolix Ring",
        back="Swith Cape",waist="Witful Belt",legs="Hagondes Pants",feet="Merlinic Crackows"}

    sets.midcast.Cure = {main="Tamaxchi", sub="Sors shield",
				head="Merlinic hood", neck="Justice Badge", lear="Novia Earring", rear="Mendicant's Earring",
                body="Vrikodara Jupon", hands="Telchine Gloves", lring="Sirona's ring", rring="Lebeche ring",
                back="Solemnity Cape", waist="Refoccilation Stone", legs="Amalric slops", feet="Medium's sabots"}
        
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = {ring1="Kunaji Ring",ring2="Asklepian Ring"}

    sets.midcast['Enhancing Magic'] = {
        head="Befouled Crown",neck="Incanter's torque", ear1="Etiolation Earring", ear2="Loquacious Earring",
        body="Telchine Chasuble",hands="Amalric gages", lring="Etana ring", rring="Leviathan ring",
        back="Ghostfyre Cape",waist="Refoccilation Stone",legs="Assiduity Pants +1", feet="Medium's sabots"}
		
    sets.midcast.Refresh = {legs="Estoqueur's Fuseau +2", neck="Stone gorget"}

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash", neck="Stone gorget"})
    
    sets.midcast['Enfeebling Magic'] = {main="Rubicundity", sub="Culminus", range="Aureole",
				head="Vitivation Chapeau +1", neck="Sanctity Necklace", rear="Lifestorm Earring", lear="Psystorm Earring",
                body="Atrophy Tabard +1", hands="Amalric gages", lring="Etana ring", rring="Leviathan ring",
                back="Ghostfyre Cape", waist="Ovate Rope", legs="Psycloth Lappas", feet="Medium's sabots"}

    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau +1"})

    sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau +1"})
    
    sets.midcast['Elemental Magic'] = {main="Rubicundity", sub="Culminus", ammo="Witchstone",
				head="Merlinic hood", neck="Sanctity Necklace", lear="Hecate's Earring", rear="Friomisi Earring",
                body="Amalric doublet", hands="Amalric gages", lring="Acumen Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Refoccilation Stone", legs="Amalric slops", feet="Merlinic Crackows"}
        
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    sets.midcast['Dark Magic'] = {main="Rubicundity", sub="Culminus", range="Aureole",
				head="Merlinic hood", neck="Sanctity Necklace", rear="Lifestorm Earring", lear="Psystorm Earring",
                body="Amalric doublet", hands="Amalric gages", lring="Acumen Ring", rring="Etana ring",
                back="Swift Cape", waist="Kentarch Belt +1", legs="Amalric slops", feet="Merlinic Crackows"}

    --sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ring1="Excelsis Ring", waist="Fucho-no-Obi"})

    sets.midcast.Aspir = sets.midcast.Drain


    -- Sets for special buff conditions on spells.

    sets.midcast.EnhancingDuration = {hands="Atrophy Gloves +1",back="Estoqueur's Cape",feet="Estoqueur's Houseaux +2"}
        
    sets.buff.ComposureOther = {head="Estoqueur's Chappel +2",
        body="Estoqueur's Sayon +2",hands="Estoqueur's Gantherots +2",
        legs="Estoqueur's Fuseau +2",feet="Estoqueur's Houseaux +2"}

    sets.buff.Saboteur = {hands="Estoqueur's Gantherots +2"}
    
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

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Pluto's Staff", ammo="Homiliary",
				head="Vitivation Chapeau +1", neck="Sanctity Necklace", lear="Etiolation Earring", rear="Ethereal earring",
                body="Amalric doublet", hands="Amalric gages", lring="Defending Ring", rring="Etana ring",
                back="Toro Cape", waist="Refoccilation Stone", legs="Amalric slops", feet="Medium's sabots"}
    

    -- Idle sets
    sets.idle = {main="Vampirism", sub="Beatific Shield +1", ammo="Homiliary",
				head="Vitivation Chapeau +1", neck="Sanctity Necklace", lear="Ethereal earring", rear="Etiolation Earring",
                body="Vrikodara Jupon", hands="Despair Finger Gauntlets", rring="Defending Ring", lring="Renaye Ring",
                back="Solemnity Cape", waist="Slipor sash", legs="Crimson Cuisses", feet="Battlecast Gaiters"}	

    sets.idle.Town = {main="Vampirism", sub="Beatific Shield +1", ammo="Homiliary",
				head="Vitivation Chapeau +1", neck="Sanctity Necklace", lear="Ethereal earring", rear="Etiolation Earring",
                body="Vrikodara Jupon", hands="Despair Finger Gauntlets", rring="Defending Ring", lring="Renaye Ring",
                back="Ghostfyre Cape", waist="Slipor sash", legs="Crimson Cuisses", feet="Battlecast Gaiters"}	
    
    sets.idle.Weak = {main="Bolelabunga",sub="Beatific Shield +1", ammo="Homiliary",
        head="Vitivation Chapeau +1",neck="Wiglen Gorget",ear1="Ethereal earring",ear2="Loquacious Earring",
        body="Amalric doublet",hands="Despair Finger Gauntlets", rring="Defending Ring", lring="Renaye Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Crimson Cuisses",feet="Battlecast Gaiters"}

    sets.idle.PDT = {main="Earth Staff", sub="Willpower Grip", ammo="Vanir Battery",
				head="Vitivation Chapeau +1", neck="Loricate Torque", lear="Ethereal earring", rear="Etiolation Earring",
                body="Emet Harness +1", hands="Despair Finger Gauntlets", rring="Defending Ring", lring="Gelatinous Ring +1",
                back="Solemnity Cape", waist="Flume Belt", legs="Amalric slops", feet="Battlecast Gaiters"}	

    sets.idle.MDT = {main="Vampirism", sub="Beatific Shield +1", ammo="Vanir Battery",
				head="Vitivation Chapeau +1", neck="Loricate Torque", lear="Ethereal earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Despair Finger Gauntlets", rring="Defending Ring", lring="Renaye Ring",
                back="Solemnity Cape", waist="Flume Belt", legs="Amalric slops", feet="Battlecast Gaiters"}	
    
    
    -- Defense sets
    sets.defense.PDT = {main="Earth Staff", sub="Volos Strap", ammo="Vanir Battery",
				head="Vitivation Chapeau +1", neck="Loricate Torque", lear="Ethereal earring", rear="Etiolation Earring",
                body="Emet Harness +1", hands="Despair Finger Gauntlets", rring="Defending Ring", lring="Gelatinous Ring +1",
                back="Solemnity Cape", waist="Slipor sash", legs="Amalric slops", feet="Battlecast Gaiters"}	

    sets.defense.MDT = {main="Vampirism", sub="Beatific Shield +1", ammo="Vanir Battery",
				head="Vitivation Chapeau +1", neck="Loricate Torque", lear="Ethereal earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Despair Finger Gauntlets", rring="Defending Ring",
                back="Solemnity Cape", waist="Slipor sash", legs="Amalric slops", feet="Battlecast Gaiters"}	

    sets.Kiting = {legs="Crimson Cuisses"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
	if player.sub_job == 'DNC' or  player.sub_job == 'NIN' then
			sets.engaged = 	{main="Vampirism", sub="Claidheamh Soluis", ammo="Ginsen",
						head="Carmine mask", neck="Sanctity Necklace", ear1="Steelflash Earring",ear2="Bladeborn Earring",
						body="Emet Harness +1", hands="Despair Finger Gauntlets", lring="Rajas Ring", rring="Mars's Ring",
						back="Kayapa Cape", waist="Windbuffet Belt +1", legs="Taeon Tights", feet="Battlecast Gaiters"}
	else
			sets.engaged = 	{main="Vampirism", sub="Beatific Shield +1", ammo="Ginsen",
						head="Carmine mask", neck="Sanctity Necklace", ear1="Steelflash Earring",ear2="Bladeborn Earring",
						body="Emet Harness +1", hands="Despair Finger Gauntlets", lring="Rajas Ring", rring="Mars's Ring",
						back="Kayapa Cape", waist="Windbuffet Belt +1", legs="Taeon Tights", feet="Battlecast Gaiters"}

	end
	
    sets.engaged.Defense = {ammo="Demonry Stone",
        head="Carmine mask",neck="Sanctity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Emet Harness +1",hands="Atrophy Gloves +1",ring1="Rajas Ring",ring2="Defending Ring",
        back="Kayapa Cape",waist="Kentarch Belt +1",legs="Osmium Cuisses",feet="Battlecast Gaiters"}

end
	
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
        equip(sets.buff.Saboteur)
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.midcast.EnhancingDuration)
        if buffactive.composure and spell.target.type == 'PLAYER' then
            equip(sets.buff.ComposureOther)
        end
    elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
	if spell.action_type == "Magic" then
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.obi[spell.element])
        end
    end
end

function precast(spell,action)
	if (string.find(spell.type,'Magic') or spell.type == "Ninjutsu" or spell.type == "Geomancy") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
        cancel_spell()
            send_command('input /item "Echo Drops" <me>')
	end
	if spell.english == 'Spectral Jig' and buffactive.Sneak then
                cast_delay(0.2)
                send_command('cancel Sneak')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 1)
    else
        set_macro_page(1, 1)
    end
end