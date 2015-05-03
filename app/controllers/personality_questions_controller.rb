class PersonalityQuestionsController < ApplicationController

  def new
    @personality_questions = PersonalityQuestion.new
  end

  def create
    @personality_questions = PersonalityQuestion.new(personality_questions_params)
    if @personality_questions.save
      score = PersonalityCalculator.new(@personality_questions).calculate
      UserPersonality.create(
          extraversion: score[:extraversion], agreeableness: score[:agreeableness],
          conscientiousness: score[:conscientiousness], neuroticism: score[:neuroticism],
          openness: score[:openness]
      )
      redirect_to :personality_questions
    else
      render :new
    end

  end

  def index
    @personalities = UserPersonality.last
    PersonalityGraphGenerator.new(@personalities).spider_graph
  end

  def personality_questions_params
    params.require(:personality_question).permit(:one_speaker, :two_show_defects, :three_exaustive_work, :four_sad,
      :five_original, :six_quiet, :seven_prestative, :eight_careless, :nine_stressless, :ten_curiosity,
      :eleven_energy, :twelve_fighter, :thirteen_confidence_worker, :fourteen_tense, :fifteen_thinker,
      :sixteen_enthusiastic, :seventeen_forgive, :eighteen_unorganized, :ninteen_concerned, :twenty_imaginative,
      :twenty_one_calm, :twenty_two_others_trust, :twenty_three_lazy, :twenty_four_stable, :twenty_five_inventive,
      :twenty_six_assertive, :twenty_seven_cold, :twenty_eight_perseverant, :twenty_nine_instable, :thrty_experience,
      :thirty_one_shy, :thirty_two_good, :thirty_three_eficient, :thirty_four_calm_in_tense, :thirty_five_routine,
      :thirty_six_friendly, :thirty_seven_rude, :thirty_eight_planner, :thirty_nine_easily_nervous,
      :fourty_like_think, :fourty_one_low_artistic, :fourty_two_cooperative, :fourty_three_distractive,
      :fourty_four_sofisticated)
  end
end
