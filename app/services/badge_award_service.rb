class BadgeAwardService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.all.each do |badge|
      @user.badges.push(badge) if send("#{badge.rule_name}_award?", badge.rule_value)
    end
  end

  def category_award?(rule_value)
    tests_length ||= Test.titles_by_category(rule_value).length
    success_length ||= @user.passed_tests_by_category(rule_value).
                             pluck(:id).uniq.length

    if (success_length == tests_length) && !success_length.zero?
      return true unless @user.has_badge('category', rule_value)
    end
    false
  end

  def level_award?(rule_value)
    tests_length ||= Test.titles_by_level(rule_value).length
    success_length ||= @user.passed_tests(rule_value).where(test_passages: {success: true}).
                                 pluck(:id).uniq.length

    if (success_length == tests_length) && !success_length.zero?
      return true unless @user.has_badge('level', rule_value)
    end
    false
  end

  def attempt_award?(_rule_value)
    attempts_number ||= @user.tests.where(id: @test_passage.test_id).count

    if attempts_number == 1
      return true
    end
    false
  end

end
