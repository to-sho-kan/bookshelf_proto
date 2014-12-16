namespace :deploy do
  desc 'naapp/app/配下のファイル・ディレクトリからpublic/配下へsymlinkを作成する'
  task :make_symlink do
    Dir.chdir Rails.root.join('public')
    Dir.glob('../ngapp/app/*') do |f|
      basename = File.basename(f)
      FileUtils.ln_s(f, "./#{basename}", force: true, verbose: true)
    end
  end

  desc 'angular系に必要なタスクを実行'
  task :prepare_ngapp do
    Dir.chdir Rails.root.join('ngapp')
    puts `npm install gulp bower`
    puts `npm install`
    puts `bower install`
  end

  desc 'herokuへのデプロイ後に実行するタスク'
  task after_deploy_heroku: [:prepare_ngapp, :make_symlink]
end
