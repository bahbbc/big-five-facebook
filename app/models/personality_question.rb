class PersonalityQuestion < ActiveRecord::Base
  belongs_to :user

  validates :one_speaker, :two_show_defects, :three_exaustive_work, :four_sad, :five_original,
            :six_quiet, :seven_prestative, :eight_careless, :nine_stressless, :ten_curiosity,
            :eleven_energy, :twelve_fighter, :thirteen_confidence_worker, :fourteen_tense, :fifteen_thinker,
            :sixteen_enthusiastic, :seventeen_forgive, :eighteen_unorganized, :ninteen_concerned, :twenty_imaginative,
            :twenty_one_calm, :twenty_two_others_trust, :twenty_three_lazy, :twenty_four_stable, :twenty_five_inventive,
            :twenty_six_assertive, :twenty_seven_cold, :twenty_eight_perseverant, :twenty_nine_instable, :thrty_experience,
            :thirty_one_shy, :thirty_two_good, :thirty_three_eficient, :thirty_four_calm_in_tense, :thirty_five_routine,
            :thirty_six_friendly, :thirty_seven_rude, :thirty_eight_planner, :thirty_nine_easily_nervous,
            :fourty_like_think, :fourty_one_low_artistic, :fourty_two_cooperative, :fourty_three_distractive,
            :fourty_four_sofisticated, :religiousness, :age, :profession, presence: true

  validates_inclusion_of :usp, in: [true, false]
end
