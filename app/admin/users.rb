# Export to CSV with the referrer_id
ActiveAdmin.register User do
  csv do
    column :id
    column :email
    column :referral_code
    column :referrer_id
    column "referrals count" do |user|
      user.referrals.count  
    end
    column :created_at
    column :updated_at
  end

  actions :index, :show, :destroy
  
  index download_links: [:csv] do
    column :id
    column :email
    column :referral_code
    column :referrer_id
    column "referrals count" do |user|
      user.referrals.count  
    end
    column :created_at
    column :updated_at
    column "referral link" do |user|
      link_to("Link", user.user_url(root_url), target: '_blank')
    end
    actions
  end

end
