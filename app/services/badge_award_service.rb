class BadgeAwardService
  def initialize(user)
    @user = user
  end

  def call
    @user.badges.push(earned_badges)
  end

  def earned_badges
    category_badges +
    level_badges +
    attempt_badge
  end

  def category_badges
    earned_badges = []
    categories = Category.all

    categories.each do |category|
      user_ids_length = @user.test_passages.success_tests_by_category(category)
                             .pluck(:test_id).uniq.length
      test_ids_length = Test.by_category(category.title).length

      if user_ids_length == test_ids_length && !user_ids_length.zero?
        earned_badge = Badge.by_category(category)
        earned_badges.push(earned_badge) unless @user.has_badge(earned_badge)
      end
    end
    earned_badges
  end

  def level_badges
    earned_badges = []
    levels = Badge.all_levels

    levels.each do |level|
      user_ids_length = @user.test_passages.success_tests_by_level(level)
                              .pluck(:test_id).uniq.length
      test_ids_length = Test.by_level(level).pluck(:id).length

      if user_ids_length == test_ids_length && !user_ids_length.zero?
        earned_badge = Badge.by_level(level)
        earned_badges.push(earned_badge) unless @user.has_badge(earned_badge)
      end
    end
    earned_badges
  end

  def attempt_badge
    earned_badge = []
    last_test_id = @user.tests.last.id
    if @user.test_passages.where(test_id: last_test_id).count == 1
      earned_badge.push(Badge.attempt_badge)
    end
    earned_badge
  end

end
