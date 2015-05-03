class CreatePersonalityQuestions < ActiveRecord::Migration
  def change
    create_table :personality_questions do |t|
      t.integer :one_speaker
      t.integer :two_show_defects
      t.integer :three_exaustive_work
      t.integer :four_sad
      t.integer :five_original
      t.integer :six_quiet
      t.integer :seven_prestative
      t.integer :eight_careless
      t.integer :nine_stressless
      t.integer :ten_curiosity
      t.integer :eleven_energy
      t.integer :twelve_fighter
      t.integer :thirteen_confidence_worker
      t.integer :fourteen_tense
      t.integer :fifteen_thinker
      t.integer :sixteen_enthusiastic
      t.integer :seventeen_forgive
      t.integer :eighteen_unorganized
      t.integer :ninteen_concerned
      t.integer :twenty_imaginative
      t.integer :twenty_one_calm
      t.integer :twenty_two_others_trust
      t.integer :twenty_three_lazy
      t.integer :twenty_four_stable
      t.integer :twenty_five_inventive
      t.integer :twenty_six_assertive
      t.integer :twenty_seven_cold
      t.integer :twenty_eight_perseverant
      t.integer :twenty_nine_instable
      t.integer :thrty_experience
      t.integer :thirty_one_shy
      t.integer :thirty_two_good
      t.integer :thirty_three_eficient
      t.integer :thirty_four_calm_in_tense
      t.integer :thirty_five_routine
      t.integer :thirty_six_friendly
      t.integer :thirty_seven_rude
      t.integer :thirty_eight_planner
      t.integer :thirty_nine_easily_nervous
      t.integer :fourty_like_think
      t.integer :fourty_one_low_artistic
      t.integer :fourty_two_cooperative
      t.integer :fourty_three_distractive
      t.integer :fourty_four_sofisticated

      t.timestamps null: false
    end
  end
end
