# 更新 Pod 版本号
def update_tag(base_path, podspec_path, config_plist_path)
  # 获取 .plist 对应 key 的值
  branch = get_info_plist_value(path: config_plist_path, key: "branch");
  # 确认分支是否正确
  ensure_git_branch(branch: branch);
  # 拉取代码
  git_pull();
  # .podsepc 版本号增加 bump_type: patch - 修复版本，minor - 次版本，major - 主版本
  version_bump_podspec(path: podspec_path, bump_type: "patch");
  # 读取 .podsepc 内容
  spec = read_podspec(path: podspec_path);
  # 更新 config.plist 中的版本号
  version = spec["version"];
  set_info_plist_value(path: config_plist_path, key: "tag", value: version);
  # 执行 pod install
  cocoapods(use_bundle_exec: false, podfile: "#{base_path}/Example/Podfile");
end

# 提交变更和创建标签
def tag_component(podspec_path, config_plist_path)
  branch = get_info_plist_value(path: config_plist_path, key: "branch");
  ensure_git_branch(branch: branch);
  spec = read_podspec(path: podspec_path);
  version = spec["version"];
  # 提交文案
  commit_message = "tag=#{version}";
  # 添加
  git_add(path: [ "./*.*", "./Example", "./fastlane"]);
  # 提交
  git_commit(path: [ "./*.*", "./Example", "./fastlane"], message: commit_message);
  # 确认工作区是否干净
  ensure_git_status_clean(show_uncommitted_changes: true);
  # 推送到远程
  push_to_git_remote();
  # 提交 tag
  add_git_tag(tag: version);
  # 推送 tag
  push_git_tags();
end

# 复刻 pod repo push
def repo_push(podspec_path, spec_path)
  spec = read_podspec(path: podspec_path);
  version = spec["version"];
  commit_message = "tag=#{version}";
  # Dir.chdir 切换工作目录
  Dir.chdir(spec_path) do
    # 1. 索引库拉取最新代码
    sh("git pull");
    Dir.chdir("#{spec_path}") do
      # 2. 新建版本文件夹
      sh("mkdir #{version}");
      # 3. 拷贝最新 .podspec 文件到版本文件夹下
      sh("cp #{podspec_path} #{spec_path}/#{version}");
    end
    # 4. 提交代码
    sh("git add * && git commit -m \"#{commit_message}\" && git push");
  end
end

