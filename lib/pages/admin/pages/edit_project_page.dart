import 'package:flutter/material.dart';

class EditProjectPage extends StatefulWidget {
  final Map<String, dynamic>? projectData;

  const EditProjectPage({
    super.key,
    this.projectData,
  });

  @override
  State<EditProjectPage> createState() => _EditProjectPageState();
}

class _EditProjectPageState extends State<EditProjectPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _contentController = TextEditingController();
  final _githubUrlController = TextEditingController();
  final _liveUrlController = TextEditingController();

  final List<String> _technologies = [];
  final _techController = TextEditingController();
  String _status = 'Draft';
  String _category = 'Web Development';

  final List<String> _categories = [
    'Web Development',
    'Mobile Development',
    'Desktop Application',
    'Game Development',
    'Machine Learning',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _loadProjectData();
  }

  void _loadProjectData() {
    if (widget.projectData != null) {
      final data = widget.projectData!;
      _titleController.text = data['title'] ?? '';
      _descriptionController.text = data['description'] ?? '';
      _contentController.text = data['content'] ?? '';
      _githubUrlController.text = data['githubUrl'] ?? '';
      _liveUrlController.text = data['liveUrl'] ?? '';
      _status = data['status'] ?? 'Draft';
      _category = data['category'] ?? 'Web Development';

      if (data['technologies'] != null) {
        _technologies.addAll(List<String>.from(data['technologies']));
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _contentController.dispose();
    _githubUrlController.dispose();
    _liveUrlController.dispose();
    _techController.dispose();
    super.dispose();
  }

  void _addTechnology() {
    final tech = _techController.text.trim();
    if (tech.isNotEmpty && !_technologies.contains(tech)) {
      setState(() {
        _technologies.add(tech);
        _techController.clear();
      });
    }
  }

  void _removeTechnology(String tech) {
    setState(() {
      _technologies.remove(tech);
    });
  }

  Future<void> _saveProject() async {
    if (!_formKey.currentState!.validate()) return;

    // TODO: Implement actual save functionality using AdminProjectProvider
    final projectData = {
      'title': _titleController.text,
      'description': _descriptionController.text,
      'content': _contentController.text,
      'githubUrl': _githubUrlController.text.isNotEmpty ? _githubUrlController.text : null,
      'liveUrl': _liveUrlController.text.isNotEmpty ? _liveUrlController.text : null,
      'technologies': _technologies,
      'status': _status,
      'category': _category,
    };

    // For now, just use the data and simulate success
    print('Updating project with data: $projectData');

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Project updated successfully!'),
          backgroundColor: Color(0xFF00D4AA),
        ),
      );
      Navigator.pop(context);
    }
  }

  Future<void> _deleteProject() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        title: const Text(
          'Delete Project',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Are you sure you want to delete this project? This action cannot be undone.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      // TODO: Implement actual delete functionality
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Project deleted successfully!'),
          backgroundColor: Colors.red,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text(
          'Edit Project',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: _deleteProject,
            icon: const Icon(Icons.delete, color: Colors.red),
            tooltip: 'Delete Project',
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: _saveProject,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00D4AA),
              foregroundColor: Colors.black,
            ),
            child: const Text('Save Changes'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Project Title
              _buildSectionTitle('Project Information'),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _titleController,
                label: 'Project Title',
                hint: 'Enter project title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a project title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Description
              _buildTextField(
                controller: _descriptionController,
                label: 'Short Description',
                hint: 'Brief description of the project',
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Category and Status
              Row(
                children: [
                  Expanded(
                    child: _buildDropdown(
                      label: 'Category',
                      value: _category,
                      items: _categories,
                      onChanged: (value) {
                        setState(() {
                          _category = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildDropdown(
                      label: 'Status',
                      value: _status,
                      items: ['Draft', 'Published'],
                      onChanged: (value) {
                        setState(() {
                          _status = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Technologies
              _buildSectionTitle('Technologies Used'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _techController,
                      label: 'Add Technology',
                      hint: 'e.g., Flutter, React, Node.js',
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _addTechnology,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00D4AA),
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Add'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (_technologies.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _technologies
                      .map((tech) => Chip(
                            label: Text(tech),
                            backgroundColor: const Color(0xFF00D4AA).withOpacity(0.2),
                            labelStyle: const TextStyle(color: Color(0xFF00D4AA)),
                            deleteIcon: const Icon(
                              Icons.close,
                              size: 18,
                              color: Color(0xFF00D4AA),
                            ),
                            onDeleted: () => _removeTechnology(tech),
                          ))
                      .toList(),
                ),
              const SizedBox(height: 32),

              // Links
              _buildSectionTitle('Project Links'),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _githubUrlController,
                label: 'GitHub Repository',
                hint: 'https://github.com/username/repository',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _liveUrlController,
                label: 'Live Demo URL',
                hint: 'https://your-project-demo.com',
              ),
              const SizedBox(height: 32),

              // Project Content
              _buildSectionTitle('Project Details'),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _contentController,
                label: 'Detailed Description',
                hint: 'Write a detailed description of your project...',
                maxLines: 10,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide detailed project information';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Image Management Section (Placeholder)
              _buildSectionTitle('Project Images'),
              const SizedBox(height: 16),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF333333),
                    style: BorderStyle.solid,
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        size: 48,
                        color: Color(0xFF666666),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Manage project images',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Upload, edit, or delete project images',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(color: Color(0xFF888888)),
        hintStyle: const TextStyle(color: Color(0xFF666666)),
        filled: true,
        fillColor: const Color(0xFF1A1A1A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF333333)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF333333)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF00D4AA)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFF888888)),
        filled: true,
        fillColor: const Color(0xFF1A1A1A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF333333)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF333333)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF00D4AA)),
        ),
      ),
      dropdownColor: const Color(0xFF2A2A2A),
      style: const TextStyle(color: Colors.white),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
